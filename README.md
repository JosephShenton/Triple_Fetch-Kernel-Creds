# Triple-Fetch-Kernel-Creds
Attempt to steal kernelcredentials from launchd + task_t pointer (Based on: CVE-2017-7047)

# About Triple Fetch (by Ian Beer from Google Project Zero)
Triple Fetch is an exploit for iOS devices prior to iOS 10.3.3
It exploits a logic error in libxpc that allows attackers to send malious messages with xpc_data objects that are backed by shared memory.

# What have is in the original exploit
The original exploit targets a lowlevel daemon on iOS that uses NSXPC. CoreAuthenticationd.
The exploit patches AMFID to allow arbitrary code execution and it also gains a send_right for launchd, allowing us to do task_for_pid 1.
Which gives us full permissions over the lowest daemon on the system, launchd.

# What you can achieve using the exploit
As the exploit comes with an example already called hello_world for using the launchd task to dump the memory of launchd with the memory regions (read/write/execute).
It will not be hard to do the following:
- Launchd has a bunch of kernel credentials. Those can be stolen from launchd in order to perform kernel patches later.
- Launchd has kernel send rights. Yes, launchd has a task_t pointer for the kernel. Which leaves us with a perfect situation to gain task_for_pid 0.

# Why this exploit is more valueable then we first thought.
As the exploit runs from userspace directly and gains root without patching the kernel, this exploit can perfectly be used for jailbreak purposes. However, since the bug is a race condition that seems to occur rarely correct. Users will have to reboot-and-retry many times before they will be jailbroken again.

# Contributions
You can always create a pull request if you want to contribute code to the repository.
We will be adding a file with a lot of offsets needed for future kernel patches.
We will be working on code that helps stealing the kernel credentials of launchd.

# Tricks
Using Apple's VoIP API's we will be trying to make the exploit automatically run in the background after each reboot.
A nice settings bundle will be added to the app so you can set a bootNonce from the settings app for future downgrade purposes.
A toggle will be added for disabling and enabling OTA updates.
Code will be added for automatically saving SHSH2-blobs using cron jobs.
I will be doing my very best to integrate tor in the jailbreak toggelable from the Settings, because everyone needs his privacy.
A content blocker is added just for fun to get rid of anoying ads in Safari.

### WE CAN NOT SUCCEED IN THIS ALONE, WE NEED YOUR SUPPORT!
