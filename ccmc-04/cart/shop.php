<?php
require_once("funx.php");
$items = createItems();
?>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<title>ccmc-04 - ショップシステム</title>
	<link rel="stylesheet" href="../../assets/css/style.css" />
	<link rel="stylesheet" href="../../assets/css/ccmc-03.css" />
	<link rel="stylesheet" href="../../assets/css/ccmc-04.css" />	
</head>
<body>
	<h1>ショップシステム</h1>
	<table>
		<tr>
			<th>楽器名</th>
			<th>価格</th>
			<th></th>
		</tr>
		<?php  for ($i = 0; $i < count($items); $i++) { ?>
		<tr>
			<td><?= $items[$i]->getName() ?></td>
			<td><?= $items[$i]->getPrice() ?>円</td>
			<td><a href="cart.php?id=<?= $i ?>">カートに入れる</a></td>
		</tr>
		<?php } ?>
	</table>
</body>
</html>