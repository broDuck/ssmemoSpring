package ssm.duck.ssmemo;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ssm.duck.dao.PageMaker;
import ssm.duck.domain.MemoVO;
import ssm.duck.domain.SearchCriteria;
import ssm.duck.service.MemoService;

@Controller
@RequestMapping("/memo/*")
public class MemoController {

	private static final Logger logger = LoggerFactory.getLogger(MemoController.class);

	@Inject
	private MemoService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());

		model.addAttribute("list", service.listSearchCriteria(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listsearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/editPage", method = RequestMethod.GET)
	public void read(@RequestParam("memo_id") int memo_id, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute(service.read(memo_id));
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("memo_id") int memo_id, SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {
		service.remove(memo_id);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/memo/list";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("memo_id") int memo_id, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute(service.read(memo_id));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPOST(MemoVO memo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("modify post");
		service.modify(memo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/memo/lsit";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(MemoVO memo, Model model) throws Exception {
		logger.info("register get");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(MemoVO memo, RedirectAttributes rttr) throws Exception {
		logger.info("register post");
		logger.info(memo.toString());
		
		service.regist(memo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/memo/list";
	}
}