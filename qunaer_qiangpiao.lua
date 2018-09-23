--   2018年9月23日  
--   适用场景：去哪儿选定时间范围之后的抢票

activity_QQ="com.tencent.mobileqq/com.tencent.mobileqq.activity.SplashActivity"
--com.tencent.mobileqq/.activity.SplashActivity
function startApp(component)
    os.execute("am broadcast -a ACTION_ENGINEERING_MODE --ei status 1")
    mSleep(2000)
	swLog("start app "..component)
	os.execute("am start -n "..component)
end

--强制停止app
function forceStopApp(pkg)
	swLog("force stop app "..pkg)
	os.execute("am force-stop "..pkg)
end
function touchClick(x,y)
    touchDown(3,x,y)
    touchUp(3)
    swLog("touchClick: "..x.." "..y)
end

function swLog(log)
    local time=os.date("%Y-%m-%d %H:%M:%S",os.time())
    print(time,log)
end

function click(x,y)
    swLog("click: "..x.." "..y)
    os.execute("input tap "..x.." "..y)
end

function findPos(point)
	mSleep(100)
-- 注意参数有sim和RGB有0x
	local x,y=FindColorInRegionFuzzy(point[1],point[2],point[3],point[4],point[3]+1,point[4]+1)	
	print("findPos: "..x.." "..y)
    if x ~= -1 then
        if(point[5])
        then
            swLog("发现: "..point[5])
        end
		return true
	end
end

function TouchMove(x1,y1,x2,y2)
	--print("开始移动")
	touchDown(3, x1, y1)
	mSleep(30)
	Movetoxy(3, x2, y2)
	mSleep(30)		
	touchUp(3)
	swLog("TouchMove: "..x1.." "..x2)
end

function swipeMove(x1,y1,x2,y2)
    --  os.execute("input tap "..x.." "..y)
    os.execute("input swipe "..x1.." " .. y1.. " "..x2.." "..y2  )
    swLog("swipeMove: "..x1.." "..x2)
end

function swipeDown(x,y)
    print("长按"..x.." "..y)
    os.execute("input swipe "..x.." " .. y.. " "..x.." "..y.." ".."800"  )
end
function clickP(point)
    local x,y=FindColorInRegionFuzzy(point[1],point[2],point[3],point[4],point[3]+1,point[4]+1)
    if (x ~=-1 )
    then
        print("找到符合颜色的点,并进行点击")
        if(point[5])
        then
            swLog("点击： "..point[5])
        end
        click(x,y)
    end
end
function writeInput(text)
    InputText(text)
    print("当前文本框输入： "..text)
end

function findareaXY(point)
    local x,y=FindColorInRegionFuzzy(point[1],point[2],point[3],point[4],point[5],point[6])
    if x~=-1
    then
       return x,y
    end
end

function regionFindP(point)
    local x,y=FindColorInRegionFuzzy(point[1],point[2],point[3],point[4],point[5],point[6])
    if (x ~=-1 )
    then
        print("找到符合颜色的点,并进行点击")
        if(point[7])
        then
            swLog("发现： "..point[7])
        end
       return true
    end
end
function regionClickP(point)
    local x,y=FindColorInRegionFuzzy(point[1],point[2],point[3],point[4],point[5],point[6])
    if (x ~=-1 )
    then
        print("找到符合颜色的点,并进行点击")
        if(point[7])
        then
            swLog("点击： "..point[7])
        end
        click(x,y)
    end
end

function osinput(str)
    os.execute("input text "..str)
    print("当前文本框输入： "..str)	
    mSleep(1000)		
end

function topSwipe()
    swipeMove(709,406,5,414) 
    mSleep(2000)
    swipeMove(600,392,12,387)
    mSleep(2000)
    swipeMove(557,445,350,439)
    mSleep(2000)
end

function abloop(atime,btime,point)
    while atime>btime
    do
        btime=btime+1
       
        if findPos(point)
        then
            if (point[5])
            then
                print("发现 "..point[5]..",结束循环")
            end
            print("结束")
            break
        end
        mSleep(1000)
    end
end

function sendQQmsg()
    local name="ax3+bx2+cx+d"
    local text="pass"
    local p1={"0xF3F3F3",90,132,195,"搜索QQ好友"}
    local p2={"0xFFFFFF",90,186,240,"确认QQ好友"}
    local p3={"0xFFFFFF",90,246,1158,"输入文字"}
    local p4={"0x12B7F5",90,612,597,"发送"}
    startApp(activity_QQ)
    mSleep(3000)
    clickP(p1)
    mSleep(2000)
    osinput(name)
    mSleep(2000)
    clickP(p2)
    mSleep(5000)
    clickP(p3)
    mSleep(5000)
    osinput(text)
    mSleep(2000)
    clickP(p4)
end

function main()
    local stime=30000
    local endtime=0
    while stime>endtime
    do
        mSleep(500)
        endtime=endtime+1
        --  TouchMove(100,600,100,600)
        swipeMove(199,600,171,1000)
        mSleep(2000)
        local p1={"0x616161",90,71,662,"第一辆车1"}
        local p1_2={"0x616161",90,71,684,"第一辆车2"} 
        local p2={"0x616161",90,72,893,"第二辆车1"}
        local p2_2={"0x616161",90,72,915,"第二辆车2"}
        local p2_3={"0x616161",90,72,908,"第二辆车3"}
        local p3={"0x616161",90,93,1147,"第三辆车"}
        local p4={"0xFF8300",90,608,599,"预定二等座"}
        local p5={"0x00BCD4",90,597,720,"去哪儿帮你买"}
        local p6={"0xFF8300",90,486,1193,"提交订单"}
        local p7={"0x333333",90,228,882,"选择出票套餐"}
        local p8={"0xFFFFFF",90,238,917,"不购买"}
        local p9={"0xFFFFFF",90,640,95,"确定套餐"}
        if findPos(p1) or findPos(p2) or findPos(p3) or findPos(p1_2) or findPos(p2_2) or findPos(p2_3)
        then
            local atime=30
            local btime=0
            if findPos(p1)
            then
                clickP(p1)
            elseif findPos(p2)
            then
                clickP(p2)
            elseif findPos(p3)
            then
                clickP(p3)
            elseif findPos(p1_2)
            then
                clickP(p1_2)
            elseif findPos(p2_2)
            then
                clickP(p2_2)
            elseif findPos(p2_3)
            then
                clickP(p2_3)
            end
            mSleep(2000)
            abloop(atime,btime,p4)
            mSleep(1000)
            if findPos(p4)
            then
                local atime=30
                local btime=0
                clickP(p4)
                mSleep(1000)
                clickP(p5)
                abloop(atime,btime,p6)
                if findPos(p6)
                then
                    swipeMove(199,900,171,200) 
                    mSleep(1000)
                    clickP(p7)
                    mSleep(1500)
                    clickP(p8)
                    clickP(p9)
                    mSleep(1000)
                    clickP(p6)
                    mSleep(5000)
                    sendQQmsg()
                    return
                end
                
            end
            
        end
    end
end
