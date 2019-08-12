repeat with i from 1 to 5
	try
		do shell script "ping -o www.apple.com"
		exit repeat
	on error
		delay 150
		if i = 5 then
			error number -128
		end if
	end try
end repeat

do shell script "say Good morning, small bastard!"
do shell script "sudo ./Users/carlamaris/Downloads/ImageSnap-v0.2.5/imagesnap"

property theMessageSubject : "Hey, Carla Maris"
property theMessageContent : "Hope your day is as beautiful as you are ;)"
property theRecipient1 : "chesasebastian1997@gmail.com"
property theRecipient2 : "maris.carla97@gmail.com"
property theMessageAttachment : "/snapshot.jpg"

tell application "Mail"
	activate
	set theMessage to make new outgoing message with properties {visible:true, subject:theMessageSubject, content:theMessageContent & return & return}
	tell theMessage
		set visible to true
		set sender to "laptop"
		make new recipient at end of to recipients with properties {address:theRecipient1}
		make new recipient at end of to recipients with properties {address:theRecipient2}
		make new attachment with properties {file name:theMessageAttachment} at after the last word of the last paragraph
	end tell
	delay 5
	send theMessage
	delay 6
	quit
end tell