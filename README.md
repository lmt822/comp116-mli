# comp116-mli ## Sept 22 2015 ### Mengtian Li

#### set1.pcap

##### 1. How many packets are there in this set?
		861
##### 2. What protocol was used to transfer files from PC to server?
		FTP
##### 3. Briefly describe why the protocol used to transfer the files is insecure?
		The file transferred using FTP is insecure because all the information is in plain text which can be analyzed easily
##### 4. What is the secure alternative to the protocol used to transfer files?
		SFTP or SSH and using SCP
##### 5. What is the IP address of the server?
		192.168.1.8
##### 6. What was the username and password used to access the server?
		USER: defcon PASS: m1ngisablowhard
##### 7. How many files were transferred from PC to server?
		6	
##### 8. What are the names of the files transferred from PC to server?
		CDkv69qUsAAq8zN.jpg
		CJoWmoOUkAAAYpx.jpg
		CKBXgmOWcAAtc4u.jpg
		CLu-m0MWoAAgjkr.jpg
		CNsAEaYUYAARuaj.jpg
		COaqQWnU8AAwX3K.jpg
##### 9. Extract all the files that were transferred from PC to server. These files must be part of your submission!
		
#### set2.pcap

##### 10. How many packets are there in this set?
		77,982
##### 11. How many plaintext username-password pairs are there in this packet set? Please count any anonymous or generic accounts.
		1
##### 12. Briefly describe how you found the username-password pairs.
		Use ettercap -T -r set2.pcap | grep "PASS" to get the USER and PASS in plain text(larry@radsot.com:Z3lenzmej)
##### 13. For each of the plaintext username-password pair that you found, identify the protocol used, server IP, the corresponding domain name (e.g., google.com), and port number.
		larry@radsot.com-Z3lenzmej: IMAP, 87.120.13.118, mail.radsot.com, 143
		
IMPORTANT NOTE: PLEASE DO NOT LOG ON TO THE WEBSITE OR SERVICE ASSOCIATED WITH THE USERNAME-PASSWORD THAT YOU FOUND!

##### 14. Of all the plaintext username-password pairs that you found, how many of them are legitimate? That is, the username-password was valid, access successfully granted? Please do not count any anonymous or generic accounts.
		1 is legitimate

#### set3.pcap

##### 15. How many plaintext username-password pairs are there in this packet set? Please count any anonymous or generic accounts.
		1
##### 16. For each of the plaintext username-password pair that you found, identify the protocol used, server IP, the corresponding domain name (e.g., google.com), and port number.
		seymore-butts: HTTP, 162.222.171.208, forum.defcon.org, 80
IMPORTANT NOTE: PLEASE DO NOT LOG ON TO THE WEBSITE OR SERVICE ASSOCIATED WITH THE USERNAME-PASSWORD THAT YOU FOUND!

##### 17. Of all the plaintext username-password pairs that you found, how many of them are legitimate? That is, the username-password was valid, access successfully granted? Please do not count any anonymous or generic accounts.
		0 is legitimate, access was forbidden by server

##### 18. Provide a listing of all IP addresses with corresponding hosts (hostname + domain name) that are in this PCAP set. Describe your methodology.
		Use the statistics bar in wireshark and find "show address resolution".
		132.245.20.178	outlook-namnortheast.office365.com
		54.77.160.239	eu-lb-p02-1890098611.eu-west-1.elb.amazonaws.com
		104.244.43.172	platform.twitter.com
		17.134.62.234	gs-loc.ls-apple.com.akadns.net
		68.67.128.73	m.anycast.adnxs.com
		172.230.246.231	e10088.dspb.akamaiedge.net
		54.230.234.180	apptentive.com
		54.88.252.118	parse-api-vpc-2122016640.us-east-1.elb.amazonaws.com
		17.134.127.249	gs-loc.ls-apple.com.akadns.net
		17.154.239.222	commnat-main.ess-apple.com.akadns.net
		54.194.52.130	eu-lb-p02-1890098611.eu-west-1.elb.amazonaws.com
		74.125.28.189	1.client-channel.google.com
		169.54.33.134	api.mixpanel.com
		199.16.156.75	t.co
		104.250.188.2	s010606.pointtoserver.com
		17.172.100.8	p05-keyvalueservice.icloud.com.akadns.net
		17.143.163.92	us-courier.push-apple.com.akadns.net
		23.99.206.196	pip.138.trouter-cus-b.cloudapp.net
		173.194.202.188	mobile-gtalk.l.google.com
		131.253.61.80	login.live.com.nsatc.net
		63.245.215.95	fhr.data.mozilla.com
		205.180.86.169	sjc05-usadmm.dotomi.com
		54.243.91.145	apiservices-a-v2-228971567.us-east-1.elb.amazonaws.com
		74.125.28.121	ghs.l.google.com
		17.143.163.229	us-courier.push-apple.com.akadns.net
		157.56.52.18	dsn11.skype-dsn.akadns.net
		52.10.224.106	tiles.r53-2.services.mozilla.com
		54.214.235.8	beacon-a-lb-731352885.us-west-2.elb.amazonaws.com
		69.22.163.250	a248.e.akamai.net
		54.246.152.126	eu-lb-p01-544546018.eu-west-1.elb.amazonaws.com
		216.58.217.196	www.google.com
		199.27.79.194	wikia.com
		74.122.190.78	api.squareup.com
		104.16.16.44	askubuntu.com
		52.6.79.41	slack.com
		54.231.12.249	s3-1-w.amazonaws.com
		17.253.34.123	time-ios.g.aaplimg.com
		23.21.44.86	settings-crashlytics-1410998606.us-east-1.elb.amazonaws.com
		66.235.135.144	appleglobal.102.112.2o7.net
		132.245.81.194	outlook-namnortheast.office365.com
		64.4.23.172	dsn4.skype-dsn.akadns.net
		23.21.47.236	settings-crashlytics-1410998606.us-east-1.elb.amazonaws.com
		54.243.52.50	apiservices-a-v2-228971567.us-east-1.elb.amazonaws.com
		17.173.255.51	profile.ess-apple.com.akadns.net
		184.172.28.153	pxpool.steelhousemedia.com
		54.69.65.63	tiles.r53-2.services.mozilla.com
		198.143.169.10	guerrillamail.com
		54.239.20.188	kwis-opf.amazon.com
		17.134.127.250	gs-loc.ls-apple.com.akadns.net
		54.154.192.74	collector1lba-2144799702.eu-west-1.elb.amazonaws.com
		162.248.201.163	email.g.shifen.com
		104.244.43.44	platform.twitter.com
		23.203.203.37	e2013.e9.akamaiedge.net
		50.22.46.101	pxpool.steelhousemedia.com
		184.24.236.104	e3191.dscc.akamaiedge.net
		74.125.224.62	ssl-google-analytics.l.google.com
		54.239.194.95	apptentive.com
		23.21.65.80	dualstack.log-334788911.us-east-1.elb.amazonaws.com
		54.152.144.243	nginx-ssl-1224277291.us-east-1.elb.amazonaws.com
		54.239.194.209	apptentive.com
		54.85.27.106	parse-api-vpc-2122016640.us-east-1.elb.amazonaws.com
		173.252.110.1	liverail.c10r.facebook.com
		54.174.217.75	slack.com
		72.21.211.10	aax-us-east.amazon-adsystem.com
		8.39.37.43	beacon.rubiconproject.net.akadns.net
		104.31.65.18	peerio.com
		131.253.61.66	login.live.com.nsatc.net
		157.55.130.176	dsn4.skype-dsn.akadns.net
		104.244.43.204	platform.twitter.com
		63.245.217.138	aus4.vips.phx1.mozilla.com
		17.143.163.215	us-courier.push-apple.com.akadns.net
		54.209.172.207	nginx-ssl-1224277291.us-east-1.elb.amazonaws.com
		23.235.47.194	wikia.com
		17.253.34.253	time-ios.g.aaplimg.com
		111.221.77.173	dsn11.skype-dsn.akadns.net
		68.67.129.145	ib.anycast.adnxs.com
		162.159.249.198	everydayfeminism.com
		130.237.28.195	webmail.kth.se
		54.192.233.158	apptentive.com
		54.171.223.250	eu-lb-p02-1890098611.eu-west-1.elb.amazonaws.com
		17.134.126.211	gs-loc.ls-apple.com.akadns.net
		107.22.237.47	apiservices-a-v2-228971567.us-east-1.elb.amazonaws.com
		17.173.255.52	profile.ess-apple.com.akadns.net
		17.134.62.236	gs-loc.ls-apple.com.akadns.net
		68.67.128.113	ib.anycast.adnxs.com
		17.164.1.38	lcdn-locator.apple.com.akadns.net
		185.70.40.118	stats.protonmail.ch
		91.190.218.69	conn.skype.akadns.net
		52.24.219.22	tiles.r53-2.services.mozilla.com
		157.55.56.160	dsn11.skype-dsn.akadns.net
		50.22.46.102	dx.steelhousemedia.com
		23.61.194.184	a1507.b.akamai.net
		23.21.225.144	settings-crashlytics-1410998606.us-east-1.elb.amazonaws.com
		54.243.83.18	apiservices-a-v2-228971567.us-east-1.elb.amazonaws.com
		8.39.37.21	perf-optimized-by.rubiconproject.net.akadns.net
		52.5.63.176	slack.com
		65.55.223.25	dsn11.skype-dsn.akadns.net
		23.21.230.199	settings-crashlytics-1410998606.us-east-1.elb.amazonaws.com
		173.194.65.94	csi.gstatic.com
		52.18.159.146	eu-lb-p01-544546018.eu-west-1.elb.amazonaws.com
		173.252.110.2	mqtt.c10r.facebook.com
		23.21.219.171	settings-crashlytics-1410998606.us-east-1.elb.amazonaws.com
		54.192.235.170	apptentive.com
		169.54.33.144	api.mixpanel.com
		23.23.98.158	dualstack.log-334788911.us-east-1.elb.amazonaws.com
		104.16.15.44	askubuntu.com
		66.35.58.75	delivery1.altitude-arena.com
		50.97.130.117	pxpool.steelhousemedia.com
		104.244.43.76	platform.twitter.com
		93.184.216.180	cs346.wac.edgecastcdn.net
		104.16.19.44	askubuntu.com
		54.243.67.247	dualstack.log-334788911.us-east-1.elb.amazonaws.com
		54.72.29.47	eu-lb-p01-544546018.eu-west-1.elb.amazonaws.com
		127.0.0.1	device.rooms.services.windowsphone.com
		199.16.156.40	api.twitter.com
		169.54.33.152	api.mixpanel.com
		157.55.130.147	dsn4.skype-dsn.akadns.net
		184.73.211.229	settings-crashlytics-1410998606.us-east-1.elb.amazonaws.com
		17.172.208.30	p02-keyvalueservice.icloud.com.akadns.net
		157.55.56.161	dsn4.skype-dsn.akadns.net
		54.225.192.101	dualstack.log-334788911.us-east-1.elb.amazonaws.com
		72.21.91.8	gp1.wac.v2cdn.net
		17.143.161.38	us-courier.push-apple.com.akadns.net
		216.58.217.206	talkgadget.l.google.com
		131.253.61.98	login.live.com.nsatc.net
		54.225.185.164	dualstack.log-334788911.us-east-1.elb.amazonaws.com
		104.244.43.236	platform.twitter.com
		54.209.5.254	nginx-ssl-1224277291.us-east-1.elb.amazonaws.com
		162.159.248.198	everydayfeminism.com
		104.31.64.18	peerio.com
		17.173.255.61	profile.ess-apple.com.akadns.net
		68.67.128.84	m.anycast.adnxs.com
		111.221.77.152	dsn11.skype-dsn.akadns.net
		169.54.33.145	api.mixpanel.com
		131.253.34.162	flex.msn.com.nsatc.net
		31.13.77.6	star.c10r.facebook.com
		54.214.0.226	beacon-a-lb-731352885.us-west-2.elb.amazonaws.com
		54.192.233.137	apptentive.com
		54.244.90.59	beacon-a-lb-731352885.us-west-2.elb.amazonaws.com
		184.169.172.18	ttd-uswest-insight-adsrvr-org-875663112.us-west-1.elb.amazonaws
		54.236.90.82	parse-api-vpc-2122016640.us-east-1.elb.amazonaws.com
		54.69.52.11	tiles.r53-2.services.mozilla.com
		132.245.19.66	outlook-namnortheast.office365.com
		132.245.52.82	outlook-namnortheast.office365.com
		17.249.25.246	api.smoot-apple.com.akadns.net
		107.23.92.238	parse-api-vpc-2122016640.us-east-1.elb.amazonaws.com
		169.54.33.206	api.mixpanel.com
		17.134.126.213	gs-loc.ls-apple.com.akadns.net
		68.67.128.77	ib.anycast.adnxs.com
		199.16.156.231	api.twitter.com
		17.143.162.18	us-courier.push-apple.com.akadns.net
		108.162.200.15	cloud.freedom.press
		64.4.23.160	dsn4.skype-dsn.akadns.net
		52.3.107.146	slack.com
		169.54.33.138	api.mixpanel.com
		68.67.128.24	ib.anycast.adnxs.com
		54.204.12.158	apiservices-a-v2-228971567.us-east-1.elb.amazonaws.com
		50.19.87.192	dualstack.log-334788911.us-east-1.elb.amazonaws.com
		50.16.239.206	apiservices-a-v2-228971567.us-east-1.elb.amazonaws.com
		17.253.16.222	a769.phobos.g.aaplimg.com
		54.243.162.175	dualstack.log-334788911.us-east-1.elb.amazonaws.com
		68.67.129.64	ib.anycast.adnxs.com
		8.39.37.23	beacon.rubiconproject.net.akadns.net
		104.244.43.108	platform.twitter.com
		206.190.38.30	appleweather-cache.internal.query.g03.yahoodns.net
		23.61.194.57	a1507.b.akamai.net
		68.67.128.85	m.anycast.adnxs.com
		199.16.156.201	syndication.twitter.com
		23.61.194.209	a1507.b.akamai.net
		132.245.81.114	outlook-namnortheast.office365.com
		205.169.30.217	a1294.w20.akamai.net
		17.173.255.24	profile.ess-apple.com.akadns.net
		91.189.89.222	launchpad.net
		64.4.23.168	dsn4.skype-dsn.akadns.net
		199.16.156.72	api.twitter.com
		54.76.77.85	collector1lba-2144799702.eu-west-1.elb.amazonaws.com
		50.22.46.104	pxpool.steelhousemedia.com
		199.96.57.7	wildcard-eb.twimg.com
		173.252.110.27	star.c10r.facebook.com
		104.16.18.44	askubuntu.com
		54.84.111.80	parse-api-vpc-2122016640.us-east-1.elb.amazonaws.com
		216.58.217.200	www-googletagmanager.l.google.com
		169.54.33.131	api.mixpanel.com
		169.54.33.207	api.mixpanel.com
		74.6.34.29	ads.flurry.com
		68.67.128.93	m.anycast.adnxs.com
		54.236.117.179	parse-api-vpc-2122016640.us-east-1.elb.amazonaws.com
		91.189.95.36	manpages.ubuntu.com
		17.172.208.47	p02-keyvalueservice.icloud.com.akadns.net
		74.122.189.133	api.squareup.com
		8.39.37.31	perf-optimized-by.rubiconproject.net.akadns.net
		199.16.156.11	t.co
		23.21.169.179	settings-crashlytics-1410998606.us-east-1.elb.amazonaws.com
		23.216.11.104	a97.gi3.akamai.net
		54.214.237.77	beacon-a-lb-731352885.us-west-2.elb.amazonaws.com
		54.192.235.241	apptentive.com
		169.54.33.177	api.mixpanel.com
		131.253.61.100	login.live.com.nsatc.net
		74.125.28.141	appspot.l.google.com
		68.67.128.253	ib.anycast.adnxs.com
		17.143.161.25	us-courier.push-apple.com.akadns.net
		216.58.217.193	googlehosted.l.googleusercontent.com
		63.245.217.43	aus4.vips.phx1.mozilla.com
		68.67.128.86	m.anycast.adnxs.com
		17.172.224.47	apple.com
		17.173.255.101	profile.ess-apple.com.akadns.net
		23.216.11.112	a97.gi3.akamai.net
		50.22.19.222	pxpool.steelhousemedia.com
		141.101.127.14	cloud.freedom.press
		63.251.210.235	t.cxt.ms
		91.189.89.223	launchpad.net
		213.199.179.161	dsn4.skype-dsn.akadns.net
		17.172.100.36	p05-keyvalueservice.icloud.com.akadns.net
		54.201.5.173	tiles.r53-2.services.mozilla.com
		173.194.65.120	csi.gstatic.com
		23.203.185.137	e673.e9.akamaiedge.net
		17.178.96.59	apple.com
		23.99.50.237	pipe.prd.skypedata.akadns.net
		54.192.235.120	apptentive.com
		17.173.255.223	commnat-cohort.ess-apple.com.akadns.net
		23.56.114.217	e673.a.akamaiedge.net
		45.55.81.45	45-55-81-45.microplatform.io
		157.55.130.150	dsn4.skype-dsn.akadns.net
		54.214.28.159	beacon-a-lb-731352885.us-west-2.elb.amazonaws.com
		104.244.43.140	platform.twitter.com
		68.67.128.79	m.anycast.adnxs.com
		23.203.202.78	e2842.e9.akamaiedge.net
		54.86.94.42	nginx-ssl-1224277291.us-east-1.elb.amazonaws.com
		132.245.249.34	outlook-namnortheast.office365.com
		205.169.30.211	a1294.w20.akamai.net
		199.16.156.104	api.twitter.com
		31.13.74.3	mqtt.c10r.facebook.com
		17.140.25.4	pv11p02sa.guzzoni-apple.com.akadns.net
		111.221.77.170	dsn11.skype-dsn.akadns.net
		216.58.217.194	pagead.l.doubleclick.net
		132.245.8.162	outlook-namnortheast.office365.com
		54.214.15.6	beacon-a-lb-731352885.us-west-2.elb.amazonaws.com
		17.173.255.102	profile.ess-apple.com.akadns.net
		184.172.43.156	rto.steelhousemedia.com
		54.225.217.75	dualstack.log-334788911.us-east-1.elb.amazonaws.com
		157.55.56.172	dsn11.skype-dsn.akadns.net
		91.189.89.224	bugs.launchpad.net
		54.218.54.170	tiles.r53-2.services.mozilla.com
		104.16.17.44	askubuntu.com
		184.73.232.97	settings-crashlytics-1410998606.us-east-1.elb.amazonaws.com
		157.55.235.149	dsn11.skype-dsn.akadns.net
		68.67.128.72	m.anycast.adnxs.com
		68.67.128.110	ib.anycast.adnxs.com
		54.245.85.102	beacon-a-lb-731352885.us-west-2.elb.amazonaws.com
		169.54.33.186	api.mixpanel.com
		63.245.217.219	aus4.vips.phx1.mozilla.com
		54.187.32.164	tiles.r53-2.services.mozilla.com
		132.245.41.34	outlook-namnortheast.office365.com
		8.39.37.33	beacon.rubiconproject.net.akadns.net
		50.18.108.169	ttd-uswest-insight-adsrvr-org-875663112.us-west-1.elb.amazonaws
		132.245.53.178	outlook-namnortheast.office365.com
		17.173.255.72	profile.ess-apple.com.akadns.net
		68.67.128.95	m.anycast.adnxs.com
		54.208.232.100	parse-api-vpc-2122016640.us-east-1.elb.amazonaws.com
		17.143.162.36	us-courier.push-apple.com.akadns.net
		54.149.166.20	tiles.r53-2.services.mozilla.com
		68.67.128.4	ib.anycast.adnxs.com
		17.142.160.59	apple.com
		216.58.216.170	googleapis.l.google.com
		199.16.156.120	syndication.twitter.com
		17.143.163.152	us-courier.push-apple.com.akadns.net
		169.54.33.194	api.mixpanel.com
		54.231.80.139	s3-1.amazonaws.com
		54.165.250.55	parse-api-vpc-2122016640.us-east-1.elb.amazonaws.com
		8.39.37.41	perf-optimized-by.rubiconproject.net.akadns.net
		104.244.43.12	platform.twitter.com
		169.54.33.141	api.mixpanel.com
		69.22.163.249	a248.e.akamai.net
		54.214.246.248	beacon-a-lb-731352885.us-west-2.elb.amazonaws.com
		216.58.217.195	www.gstatic.com
		169.54.33.164	api.mixpanel.com
		17.173.255.103	profile.ess-apple.com.akadns.net
		69.22.163.234	a248.e.akamai.net
		65.55.246.149	all.contacts.msn.com.akadns.net
		91.189.89.225	bugs.launchpad.net
		2600:1406:1a:39e::c77	e3191.dscc.akamaiedge.net
		2a03:2880:2110:df07:face:b00c:0:1	star.c10r.facebook.com
		2607:f8b0:4007:808::200e	play.l.google.com
		2600:1406:1a:3a2::c77	e3191.dscc.akamaiedge.net
		2a03:2880:f022:5:face:b00c:0:8e	mqtt.c10r.facebook.com



#### General Questions

##### 19. How did you verify the successful username-password pairs?
		Follow TCP stream and check for response code to see if login was successfull or not

##### 20. What advice would you give to the owners of the username-password pairs that you found so their account information would not be revealed "in-the-clear" in the future?
		Use more secure protocol such as HTTPS or SSH, so that confidential information will not be easily analyzed.