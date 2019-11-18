<?php
require_once "Item.php";
?>
<?php
/**
 * 商品の配列を生成する。
 * @return array Itemクラスのインスタンスを要素とする配列
 */
function createItems():array {
	$items = array(
		new Item("アップライトピアノ", 600000),
		new Item("電子ピアノ", 220000), 
		new Item("ローズピアノ", 280000),
		new Item("エレキギター", 80000),
		new Item("アコースティックギター", 200000),
		new Item("エレキベース", 120000),
		new Item("アップライトベース", 420000)
	);	
	return $items;
}
?>