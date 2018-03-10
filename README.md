# LEDE-MR33
Bringup for the Cisco Meraki MR33 Access Point on LEDE!

Currently based on commit [74beb6f7104e7d5003adc061e0df8016484a6730](https://github.com/openwrt/openwrt/commit/74beb6f7104e7d5003adc061e0df8016484a6730)

And the following cherry picks:
  * https://patchwork.ozlabs.org/patch/752962/ for switch defines (pinctl part merged upstream)
  * https://git.lede-project.org/?p=lede/blogic/staging.git;a=commit;h=af81e7775f99b82933101f9bc5b6d83decc37fa4 for PCI-E Wireless
  * https://patchwork.ozlabs.org/patch/774684/ for 2nd i2c interface

Building
-----
#### Build Only
`./build.sh`

#### Modify Configs and Build
`./build.sh modify`

Note that you will need to run a modify on the first compile to select the ipq806x target, MR33 device in the LEDE menuconfig.

Booting & Flashing
-----
Booting and flashing documentation can be found on [Google Drive](https://drive.google.com/drive/folders/1jJa8LzYnY830v3nBZdOgAk0YQK6OdbSS)

To Do
-----
##### MR33
* Writeup flashing/booting process

Working
-----
##### MR33
* NAND
* Bluetooth - See this [Commit](https://github.com/riptidewave93/LEDE-MR33/commit/43ca7f34e0437ef9384fc38f1c4de6a843f1dd98).
* SoC Wireless
* PCIe Wireless
* Ethernet (IGMP and tagged VLAN might need further testing)
* LED's/GPIOs
* Reset button
* Serial (It's TTL-232R-3V3 with 115200-N-8-1)
* System Integration
* Kernel Device Profile
* SysUpgrade

Notice
------
No promises this won't brick your unit, and no promises that this will even work!

<sup><sup><sub>Hello Cisco/Meraki, please <a href="mailto:chrisrblake93@gmail.com">send me</a> free stuff!</sub></sup></sup>
