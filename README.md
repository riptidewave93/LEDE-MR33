# LEDE-MR33
Bringup for the Cisco Meraki MR33 Access Point on LEDE!

Currently based on commit [83e4ed3497d40dc7da9d2d2c2febbf6272815c51](https://github.com/lede-project/source/commit/83e4ed3497d40dc7da9d2d2c2febbf6272815c51)

And the following cherry picks:
  * https://patchwork.ozlabs.org/patch/752962/
  * https://patchwork.ozlabs.org/patch/761243/
  * https://git.lede-project.org/?p=lede/blogic/staging.git;a=commit;h=af81e7775f99b82933101f9bc5b6d83decc37fa4
  * https://github.com/chunkeey/LEDE-IPQ40XX/commit/8755ddc2862037459fe7808cb132a36158f7f7a7

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
* Fixup Ethernet Driver (unstable - 1Gb only currently)
* Sysupgrade

Working
-----
##### MR33
* NAND
* Bluetooth
* SoC Wireless
* PCIe Wireless
* LED's/GPIOs
* Reset button
* System Integration
* Kernel Device Profile

Notice
------
No promises this won't brick your unit, and no promises that this will even work!

<sup><sup><sub>Hello Cisco/Meraki, please <a href="mailto:chrisrblake93@gmail.com">send me</a> free stuff!</sub></sup></sup>
