
package ssm.duck.ssmemo;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ssm.duck.domain.UserVO;
import ssm.duck.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private UserService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "home";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void ajaxTest() {

	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(UserVO user, Model model) throws Exception {
		logger.info("register get ...");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(UserVO user, RedirectAttributes rttr) throws Exception {
		logger.info("regist post ...");
		logger.info(user.toString());
		
		int count = service.readCheck(user);

		if (count == 0) {
			service.regist(user);
		} else {
			logger.info("is duplicate!");
		}

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/memo/list";
	}

}
