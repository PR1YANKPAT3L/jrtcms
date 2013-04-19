<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="tangs" uri="/WEB-INF/tangs.tld" %>
<script type="text/javascript" src="/js/jcarousellite_1.0.1c5.js"></script>
<!--  首页顶部滑动新闻模块 start  -->
			
					<div class="TogetherBulletin">
						<ol>
						<tangs:ryc_newslist web_id="2"  value="3" num="3" categoryCn="网站公告">
						<li><a href="${url}" title="${title }">${title}</a></li>
							
							</tangs:ryc_newslist>
						</ol>
					</div>
			<script>
			$(function() {
				$(".TogetherBulletin").jCarouselLite({
					speed: 600,
					visible: 3,
					auto: 5000,
					mouseWheel: true
				});
			});
			</script>
			<!--  首页顶部滑动新闻模块 end  -->
