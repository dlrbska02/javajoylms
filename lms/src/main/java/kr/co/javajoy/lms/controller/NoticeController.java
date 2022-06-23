package kr.co.javajoy.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.javajoy.lms.CF;
import kr.co.javajoy.lms.service.NoticeService;
import kr.co.javajoy.lms.vo.BoardForm;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping("/getNoticeByPage")
	public String getNoticeByPage(Model model
			,@RequestParam(name = "currentPage", defaultValue = "1") int currentPage
			,@RequestParam(name = "rowPerPager", defaultValue = "10") int rowPerPage) { // 10개 부터 페이징처리 기능
		
		Map<String, Object> map = noticeService.getNoticeByPage(currentPage, rowPerPage);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("lastPage",map.get("lastPage"));
		model.addAttribute("currentPage",currentPage);
		log.debug(CF.WSH + "NoticeController.getNoticeByPage.notice : ", currentPage);
		return "board/getNoticeByPage";
	}
	@GetMapping("/getNoticeOne")
	public String getNoticeOne(Model model
			,HttpServletRequest request
			,@RequestParam(name = "boardNo") int boardNo) {
		log.debug(CF.WSH + "NoticeController.getNoticeOne.boardNo : "+ boardNo);
		String path = request.getServletContext().getRealPath("file/board_file/");
		
		Map<String, Object> map = noticeService.getNoticeOne(boardNo);
		model.addAttribute("path", path);
		model.addAttribute("board", map.get("board"));
		model.addAttribute("boardfile", map.get("boardfile"));
		log.debug(CF.WSH + "NoticeController.getNoticeOne.map : "+ map);
		return "board/getNoticeOne";
	}
	@GetMapping("/addNotice")
	public String addNotice() {
		return "board/addNotice";
	}
	@PostMapping("/addNotice")
	public String addNotice(HttpServletRequest request, BoardForm boardForm) {
		String path = request.getServletContext().getRealPath("file/board_file/");
		log.debug(CF.WSH + "NoticeController.addNotice(Post).path : "+ path);
		
		log.debug(CF.WSH + "NoticeController.addNotice(Post).boardFrom : "+ boardForm);
		List<MultipartFile> boardfileList = boardForm.getBoardfileList();
		if(boardfileList.get(0).getSize() > 0) { // 하나 이상의 파일이 업로드 되면
			for(MultipartFile mf : boardfileList) {
				log.debug(CF.WSH + "NoticeController.addNotice(Post).boardfileList : "+boardfileList);
				log.debug(CF.WSH + "NoticeController.addNotice(Post).filename : "+mf.getOriginalFilename());
			}
			
		}
		noticeService.addNotice(boardForm, path);
		return "redirect:/getNoticeByPage";
	}
	@GetMapping("/removeNoticefile") // 파일 먼저 삭제
	public String removeNoticefile(HttpServletRequest request
			,@RequestParam(name="boardFileNo") int boardfileNo
			,@RequestParam(name="boardNo") int boardNo) {
		log.debug(CF.WSH + "NoticeController.removeNoticefile(Get).boardFileNo : "+ boardfileNo);
		log.debug(CF.WSH + "NoticeController.removeNoticefile(Get).boardNo : "+ boardNo);
		String path = request.getServletContext().getRealPath("file/board_file/");
			noticeService.removefileNotice(boardfileNo,path);
		return "redirect:/modfyNotice?boardNo="+boardNo;
	}
	@GetMapping("/removeNotice")
	public String removeNoice(HttpServletRequest request
			,@RequestParam(name="boardNo") int boardNo) {
		log.debug(CF.WSH + "NoticeController.removeNotice(Get).boardNo : "+ boardNo);
		String path = request.getServletContext().getRealPath("file/board_file/");
		noticeService.removeNotice(boardNo, path);
	return "redirect:/getNoticeByPage";
	}
	
	
	
	
	
	
	
	
	
	
	

}