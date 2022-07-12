<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>modifySubjetVideo</title>
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./public/assets/css/tailwind.output.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
	defer></script>
<script src="./public/assets/js/init-alpine.js"></script>
</head>
<body>
	<div class="flex h-screen bg-gray-50 dark:bg-gray-900"
		:class="{ 'overflow-hidden': isSideMenuOpen}">
		<aside class="z-20 flex-shrink-0 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block">
			 <c:if test="${level eq 1}">
				<div id="adminSideNav"></div>
			</c:if>
			<c:if test="${level eq 2}">
				<div id="teacherSideNav"></div>
			</c:if>
		</aside>
		<div class="flex flex-col flex-1 w-full">
			<c:if test="${level eq 1}">
				<div id="adminHeaderNav"></div>
			</c:if>
			<c:if test="${level eq 2}">
				<div id="teacherHeaderNav"></div>
			</c:if>
			<main class="h-full pb-16 overflow-y-auto">
				<div class="container grid px-6 mx-auto">
					<h2
						class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">${loginUser}님의
						modify video</h2>
					<!-- CTA -->
					<a
						class="flex items-center justify-between p-4 mb-8 text-sm font-semibold text-purple-100 bg-purple-600 rounded-lg shadow-md focus:outline-none focus:shadow-outline-purple"
						href="${pageContext.request.contextPath}/getSubjectByPage">
						<div class="flex items-center">
							<svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                  <path
									d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                </svg>
							<span>Subject Management Page</span>
						</div> <span>강좌 목록 &RightArrow;</span>
					</a>

					<!-- With avatar -->
					<h4
						class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
						강의 영상 수정</h4>
					<div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
						<div class="w-full overflow-x-auto">
							<form id="modifySubjectVideoForm" method="post"
								action="${pageContext.request.contextPath}/modifySubjectVideo">
								<table class="w-full whitespace-no-wrap">
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="px-4 py-3">
											<div class="flex items-center text-sm">
												<!-- Avatar with inset shadow -->
												<div>
													<p class="font-semibold">강의 영상 제목</p>
												</div>
											</div>
										</td>
										<td class="px-4 py-3">
											<div class="flex items-center text-sm">
												<!-- Avatar with inset shadow -->
												<div>
													<p class="font-semibold">
														<input type="hidden" name="subjectNo" value="${subjectVideo.subjectNo}">
														<input type="hidden" name="subjectVideoNo" value="${subjectVideo.subjectVideoNo}">
														<input
															class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
															type="text" id="subjectVideoTitle" value="${subjectVideo.subjectVideoTitle}"
															name="subjectVideoTitle">
													</p>
												</div>
											</div>
										</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="px-4 py-3">
											<div class="flex items-center text-sm">
												<!-- Avatar with inset shadow -->
												<div>
													<p class="font-semibold">영상 내용</p>
												</div>
											</div>
										</td>
										<td class="px-4 py-3">
											<div class="flex items-center text-sm">
												<!-- Avatar with inset shadow -->
												<div>
													<p class="font-semibold">
														<input
															class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
															type="text" id="subjectVideoContent" value="${subjectVideo.subjectVideoContent}"
															name="subjectVideoContent">
													</p>
												</div>
											</div>
										</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="px-4 py-3">
											<div class="flex items-center text-sm">
												<!-- Avatar with inset shadow -->
												<div>
													<p class="font-semibold">강좌 URL</p>
												</div>
											</div>
										</td>
										<td class="px-4 py-3">
											<div class="flex items-center text-sm">
												<!-- Avatar with inset shadow -->
												<div>
													<p class="font-semibold">
														<input
															class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
															type="text" id="subjectVideoUrl" value="${subjectVideo.subjectVideoUrl}" 
															name="subjectVideoUrl">
													</p>
												</div>
											</div>
										</td>
									</tr>
								</table>
								<br>
								<div style="display: inline;">
									<div style="float: inherit;"display:inline-block;"></div>
									<button
										class="px-10 py-4 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
										style="margin: auto; display: block;" type="button"
										id="modifyVideo">영상 수정</button>
								</div>
							</form>
						</div>
						<br>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script>
	$('#modifyVideo').click(function() {
		if ($('#subjectVideoTitle').val() == '') {
			Swal.fire('제목을 입력해주세요');
			return;
		} else if ($('#subjectVideoContent').val() == '') {
			Swal.fire('내용을 입력해주세요');
			return;
		} else if ($('#subjectVideoUrl').val() == '') {
			Swal.fire('URL을 입력해주세요');
			return;
		} else {
			$('#modifySubjectVideoForm').submit();
		}
	});
</script>
</html>
