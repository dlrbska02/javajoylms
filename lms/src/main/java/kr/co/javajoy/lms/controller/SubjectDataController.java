package kr.co.javajoy.lms.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.javajoy.lms.service.SubjectDataService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SubjectDataController {
	@Autowired SubjectDataService subjectdataService;
	// 학생 리스트 URL GetMapping
		@GetMapping("/subjectDataList")
		public String subjectDataList(Model model,
				// 페이징
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(name = "rowPerPage", defaultValue = "10") int rowPerPage) {
		Map<String, Object> map = subjectdataService.getSubjectDataList(currentPage, rowPerPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
			// studentList.jsp로 이동.
			return "subjectDataList";
	}
}
