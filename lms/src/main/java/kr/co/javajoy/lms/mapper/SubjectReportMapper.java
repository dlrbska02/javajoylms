package kr.co.javajoy.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.javajoy.lms.vo.SubjectFile;
import kr.co.javajoy.lms.vo.SubjectReport;
import kr.co.javajoy.lms.vo.SubjectReportComment;

@Mapper
public interface SubjectReportMapper {
	
	// 1) 과제 게시판 글 리스트 출력
	
	// 과제 게시판 글 총 개수
	int selectTotalCount();
	// 과제 게시판 글 리스트 출력
	List<SubjectReport> selectSubjectReportListByPage(Map<String, Object> map);
	
	
	// 2) 과제 게시판 글 상세보기 + 파일 이름 리스트 출력 + 댓글 리스트 출력
	
	// 과제 게시판 글 상세보기
	List<SubjectReport> selectSubjectReportOne(int subjectBoardNo);
	// 과제 게시판 글 상세보기의 파일 이름 리스트 출력
	List<String> selectSubjectReportFileNameList(int subjectBoardNo);
	// 과제 게시판 글 상세보기의 파일 리스트 출력
	List<String> selectSubjectReportFileList(int subjectBoardNo);
	// 각 글의 총 댓글 수
	int selectCommentTotalCountByNotice(int subjectBoardNo);
	// 과제 게시판 각 글의 댓글 리스트
	List<SubjectReportComment> selectCommentListByPage(Map<String, Object> map);
	
	
	// 3) 과제 게시판 글 입력 + 파일 입력
	
	// subject_board에 글 입력
	int insertSubjectBoard(SubjectReport subjectReport);
	// 과제 게시판에 글 입력
	int insertSubjectReport(SubjectReport subjectReport);
	// 과제 게시판 글에 파일 입력
	int insertSubjectFile(SubjectFile subjectFile);
}
