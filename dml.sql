use bbs;
select 
    *
from
    posts;
INSERT INTO `bbs`.`posts` (`username`, `title`, `content`) VALUES ('jelly', '庐山西海神韵', '庐山西海—柘林湖
　　前不久去了一趟西海，西海的美景让我流连忘返，为了表示我对他的喜爱，我觉得我必须写点什么来诠释一下这个地方，让西海以后也可以成为大家的一个旅游之地~~
　　刚开始想去旅行的时候，选了半天也不知道选哪里好，后面看到庐山西海这个地方被人家评价的还是挺高的，说这个地方都是真山真水，有一级的空气一级的水质，更是听说这里还有桃花水母。。。。冲着这些，想想我们常在那样繁华的城市，车水马龙的，雾霾雾霾，我们都被雾给埋了好久了。所以，带着这样一个心情我选择了这里');
INSERT INTO `bbs`.`posts` (`username`, `title`, `content`) VALUES ('black', '萍乡武功山', '武功山位于罗霄山脉北段，位于江西西部，地跨吉安市安福县、萍乡市的芦溪县、宜春市袁州区三地，是以自然风光为主要特色的山岳型风景区，同时也为国家AAAA级风景名胜区。武功山已成功入选首批世界自然遗产预备名单');

select * from replys;
INSERT INTO `bbs`.`replys` (`postid`, `username`, `content`) VALUES ('1', 'black', '真好');
INSERT INTO `bbs`.`replys` (`postid`, `username`, `content`) VALUES ('1', 'black', '好顶赞');
