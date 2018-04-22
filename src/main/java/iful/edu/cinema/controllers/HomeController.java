package iful.edu.cinema.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import iful.edu.cinema.dao.impl.SqliteDao;
import iful.edu.cinema.objects.CinemaSession;

@Controller
public class HomeController {
	public static final int ENTRIES_COUNT = 10;
	public int pageCount = 1;
	@Autowired
	private SqliteDao sqliteDao;

	@RequestMapping(value = "/")
	public String currentSessionList(@RequestParam(required = false, defaultValue = "1", value = "page_id") int page, ModelMap mp) {
		List<CinemaSession> list = sqliteDao.getCinemaSessions(true, page);
		pageCount = 1;
		checkPageCount(true, list);
		mp.addAttribute("pageCount", pageCount);
		mp.addAttribute("list", list);
		return "home";
	}

	@RequestMapping(value = "/allSessions")
	public String allSessionList(@RequestParam(required = false, defaultValue = "1", value = "page_id") int page, ModelMap mp) {
		List<CinemaSession> list = sqliteDao.getCinemaSessions(false, page);
		pageCount = 1;
		checkPageCount(false, list);
		mp.addAttribute("pageCount", pageCount);
		mp.addAttribute("list", list);
		return "home";
	}

	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, ModelMap mp) {
		List<CinemaSession> list = sqliteDao.getSessionBySearch(request.getParameter("searchField"), request.getParameter("searchValue"));
		mp.addAttribute("list", list);
		return "searchResult";
	}

	public void checkPageCount(boolean type, List<CinemaSession> list) {
		if (list.size() == ENTRIES_COUNT) {
			pageCount++;
			if (sqliteDao.getCinemaSessions(type, pageCount).size() == 0) {
				pageCount--;
				return;
			} else if (sqliteDao.getCinemaSessions(type, pageCount).size() > 0 && sqliteDao.getCinemaSessions(type, pageCount).size() < ENTRIES_COUNT) {
				return;
			} else
				checkPageCount(type, sqliteDao.getCinemaSessions(type, pageCount));
		}
	}

}
