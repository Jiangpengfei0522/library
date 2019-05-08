var changeDD = 1;//->一个全局变量
function YYYYMMDDstart() {
    MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    //先给年下拉框赋内容
    var y = new Date().getFullYear();
    for (var i = (y - 2); i < (y + 2); i++) //以今年为准，前30年，后30年
        document.seat_select.YYYY.options.add(new Option(i, i));
    //赋月份的下拉框
    for (var i = 1; i < 13; i++){
        if(i<10)
            document.seat_select.MM.options.add(new Option("0"+i, "0"+i));
        else
            document.seat_select.MM.options.add(new Option(i+"", i));
    }
    document.seat_select.YYYY.value = y;
    document.seat_select.MM.value = "0" + (new Date().getMonth()+1);
    var n = MonHead[new Date().getMonth()];
    if (new Date().getMonth() == 1 && IsPinYear(YYYYvalue)) n++;
    writeDay(n); //赋日期下拉框
    //->赋值给日，为当天日期
//        document.reg_testdate.DD.value = new Date().getDate();
}
if (document.attachEvent)
    window.attachEvent("onload", YYYYMMDDstart);
else
    window.addEventListener('load', YYYYMMDDstart, false);

function YYYYDD(str) //年发生变化时日期发生变化(主要是判断闰平年)
{
    var MMvalue = document.seat_select.MM.options[document.seat_select.MM.selectedIndex].value;
    if (MMvalue == "") {
//            var e = document.reg_testdate.DD;
        optionsClear(e);
        return;
    }
    var n = MonHead[MMvalue - 1];
    if (MMvalue == 2 && IsPinYear(str)) n++;
    writeDay(n)
}

function MMDD(str) //月发生变化时日期联动
{
    var YYYYvalue = document.seat_select.YYYY.options[document.seat_select.YYYY.selectedIndex].value;
    if (YYYYvalue == "") {
        var e = document.seat_select.DD;
        optionsClear(e);
        return;
    }
    var n = MonHead[str - 1];
    if (str == 2 && IsPinYear(YYYYvalue)) n++;
    writeDay(n)
}

function writeDay(n) //据条件写日期的下拉框
{
    var e = document.seat_select.DD;
    optionsClear(e);
    for (var i = 1; i < (n + 1); i++)
    {
        if(i<10)
            e.options.add(new Option("0"+i, "0"+i));
        else
            e.options.add(new Option(i+"", i));
        if(i == changeDD){
            e.options[i].selected = true;  //->保持选中状态
        }
    }
    console.log(i);
    console.log(changeDD);
}

function IsPinYear(year) //判断是否闰平年
{
    return (0 == year % 4 && (year % 100 != 0 || year % 400 == 0));
}

function optionsClear(e) {
    e.options.length = 1;
}
//->随时监听日的改变
function DDD(str){
    changeDD = str;
}