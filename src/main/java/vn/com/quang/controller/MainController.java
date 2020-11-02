package vn.com.quang.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.quang.entity.User;
import vn.com.quang.entity.UserDetail;
import vn.com.quang.service.UserService;

@Controller
@Transactional
public class MainController extends BaseController {

	@Autowired
	UserService userService;

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String welcomePage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User userLogin = this.getUser();
		session.setAttribute("userLogin", userLogin);

		UserDetail userDetail = this.userService.getUserDetailByUsername(userLogin.getUsername());

		if (userDetail == null) {
			// chua co tai khoan
			// move to trang welcomepage
			return "welcomePage";
		} else {
			return "redirect:/user-detail/view/" + userDetail.getId();
		}
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(Model model) {
		return "adminPage";
	}

	@RequestMapping(value = "/sign-up", method = RequestMethod.GET)
	public String registerPage(Model model) {

		return "sign_up";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(Model model) {

		return "login_page_template";
	}

	@RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
	public String logoutSuccessfulPage(Model model) {
		model.addAttribute("title", "Logout");
		return "logoutSuccessfulPage";
	}

	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo(Model model, Principal principal) {

		// Sau khi user login thanh cong se co principal
		String userName = principal.getName();

		System.out.println("User Name: " + userName);

		return "userInfoPage";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model, Principal principal) {

		if (principal != null) {
			model.addAttribute("message",
					"Hi " + principal.getName() + "<br> You do not have permission to access this page!");
		} else {
			model.addAttribute("msg", "You do not have permission to access this page!");
		}
		return "403Page";
	}
}