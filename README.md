# LEDE-MR33
Bringup for the Cisco Meraki MR33 Access Point on LEDE!

Currently based on commit [31e9445b7e614f54daa0caf3148e223d088311ab](https://github.com/lede-project/source/commit/31e9445b7e614f54daa0caf3148e223d088311ab)

And the following cherry picks:
  * https://patchwork.ozlabs.org/patch/752962/ for switch defines (pinctl part merged upstream)
  * https://git.lede-project.org/?p=lede/blogic/staging.git;a=commit;h=af81e7775f99b82933101f9bc5b6d83decc37fa4 for PCI-E Wireless
  * https://github.com/chunkeey/LEDE-IPQ40XX/commit/8755ddc2862037459fe7808cb132a36158f7f7a7 for correct CPU Frequency
  * https://patchwork.ozlabs.org/patch/774684/ for 2nd i2c interface

Building
-----
#### Build Only
`./build.sh`

#### Modify Configs and Build
`./build.sh modify`

Note that you will need to run a modify on the first compile to select the ipq806x target, MR33 device in the LEDE menuconfig.

Booting
-----
It's a [secret](https://www.youtube.com/watch?v=sTSA_sWGM44).

Flashing
-----
This is also a [secret](https://www.youtube.com/watch?v=gvYfRiJQIX8).

To Do
-----
##### MR33
* Fixup Ethernet Driver (1Gbps/FD only & inbound ARP issues)
  * Maybe move to development code for qca8k from [blogic's staging repo](https://git.lede-project.org/?p=lede/blogic/staging.git;a=commit;h=dd3bdac6d1dcd98d4d494052f7df31ca21558d6f)
* Cleanup things
* Writeup flashing/booting process

Working
-----
##### MR33
* NAND
* Bluetooth - See this [Commit](https://github.com/riptidewave93/LEDE-MR33/commit/43ca7f34e0437ef9384fc38f1c4de6a843f1dd98).
* SoC Wireless
* PCIe Wireless
* LED's/GPIOs
* Reset button
* System Integration
* Kernel Device Profile
* SysUpgrade

Notice
------
No promises this won't brick your unit, and no promises that this will even work!

<sup><sup><sub>Hello Cisco/Meraki, please <a href="mailto:chrisrblake93@gmail.com">send me</a> free stuff!</sub></sup></sup>
