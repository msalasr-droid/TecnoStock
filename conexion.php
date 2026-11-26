<?php
session_start();
$db = new PDO('mysql:host=localhost;dbname=tecnostock_proyecto;charset=utf8mb4','root','',[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,PDO::ATTR_EMULATE_PREPARES=>false]);
function h($v){return htmlspecialchars((string)$v,ENT_QUOTES,'UTF-8');}
function go($p='inicio'){header('Location: index.php?p='.$p);exit;}
function q($sql,$args=[]){global $db;$s=$db->prepare($sql);$s->execute($args);return $s;}
function token(){return '<input type="hidden" name="csrf" value="'.h($_SESSION['csrf']).'">';}
function entero($v,$min=0){$n=filter_var($v,FILTER_VALIDATE_INT,['options'=>['min_range'=>$min,'max_range'=>2147483647]]);if($n===false)throw new RuntimeException('Cantidad inválida.');return $n;}
$_SESSION['csrf'] ??= bin2hex(random_bytes(32));
