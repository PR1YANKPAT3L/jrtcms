/**
 * 导航栏切换
 * idname id的名字
 * hout 鼠标离开时的样式
 * hover 鼠标悬停时或点击是的样式
 * length 要切换的div的个数
 * 
 */
function fetch_object(idname) {
	var my_obj = $(idname);
	return my_obj;
}
function toggle_nav(obj,hout,hover,length) {
	for (i = 1; i <= length; i++) {
		var sub_nav = fetch_object("#sub_nav_" + i);
		var sub_nav_index = fetch_object("#sub_nav_0");
		sub_nav_index.style.display = "none";
		var id = $("#nav_"+i);
		if (obj == i) {	
			id.removeClass(hout);
        	id.addClass(hover);
			sub_nav.style.display = "block";
		} else {
			id.removeClass(hover);
        	id.addClass(hout);
			sub_nav.style.display = "none";
		}
	}
}