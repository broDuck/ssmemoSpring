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
import ssm.duck.domain.SaveVO;
import ssm.duck.domain.SearchCriteria;
import ssm.duck.service.MemoService;
import ssm.duck.service.SaveService;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

@Controller
@RequestMapping("/memo/*")
public class MemoController {

	private static final Logger logger = LoggerFactory.getLogger(MemoController.class);

	@Inject
	private MemoService service;

	@Inject
	private SaveService saveService;

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public void listPage(@RequestParam(value = "user_id") String user_id, Model model) throws Exception {

		logger.info(user_id);
		model.addAttribute("list", service.listPage(user_id));
		model.addAttribute("user_id", user_id);
	}

	@RequestMapping(value = "/editPage", method = RequestMethod.GET)
	public void read(@RequestParam(value = "id") String id, Model model) throws Exception {
		if (saveService.isExist(id) != 0) {
			model.addAttribute(saveService.read(id));
		} else {
			SaveVO vo = new SaveVO();
			vo.setMemo_id("0");
			vo.setSave_info("0");

			model.addAttribute(vo);
		}
		model.addAttribute(service.read(id));
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void androidRead(@RequestParam(value = "id") String id, Model model) throws Exception {
		if (saveService.isExist(id) != 0) {
			model.addAttribute(saveService.read(id));
		} else {
			SaveVO vo = new SaveVO();
			vo.setMemo_id("0");
			vo.setSave_info("0");

			model.addAttribute(vo);

		}
		model.addAttribute(service.read(id));
	}

	@RequestMapping(value = "/editPage", method = RequestMethod.POST)
	public String save(SaveVO save) throws Exception {
		if (saveService.isExist(save.getMemo_id()) != 0) {
			saveService.update(save);
		} else {
			saveService.regist(save);
		}

		return "redirect:/memo/editPage?id=" + save.getMemo_id();
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.POST)
	public String androidSave(SaveVO save) throws Exception {
		if (saveService.isExist(save.getMemo_id()) != 0) {
			saveService.update(save);
		} else {
			saveService.regist(save);
		}

		return "redirect:/memo/readPage?id=" + save.getMemo_id();
	}


	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public void remove(@RequestParam("memo_hash") String memo_hash)
			throws Exception {
		logger.info("memo is deleted!");
		int id = service.listsearchCount(memo_hash);

		service.removeGroup(id);
		service.remove(memo_hash);
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("memo_id") int memo_id, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute(service.read(""));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPOST(MemoVO memo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("modify post");
		service.modify(memo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/memo/list";
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