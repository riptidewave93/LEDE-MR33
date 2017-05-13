# LEDE-MR33
Bringup for the Cisco Meraki MR33 Access Point on LEDE!

Currently based on commit [1a16cb9c67f0d2c530914aec31c721b75f03a908](https://github.com/lede-project/source/commit/1a16cb9c67f0d2c530914aec31c721b75f03a908)

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
* Wireless (SoC Radios)
* PCIe Wireless (If Possible)
* Fixup Ethernet Driver (very hacky currently)
* System Integration
* Sysupgrade
* Cleanup DTS if possible

Working
-----
##### MR33
* NAND
* Bluetooth
* Ethernet (dirty code)
* LED's/GPIOs
* Reset button
* Kernel Device Profile

Notice
------
No promises this won't brick your unit, and no promises that this will even work!

<sup><sup><sub>Hello Cisco/Meraki, please <a href="mailto:chrisrblake93@gmail.com">send me</a> free stuff!</sub></sup></sup>
