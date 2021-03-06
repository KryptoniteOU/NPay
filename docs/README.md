NPay Core
=====================


White Paper
---------------------
### White Paper v1

- [White Paper Download](http://downloads.npay.network/etc/NPAY%20Whitepaper%20v1.pdf)


Setup
---------------------
[NPay Core](http://npay.network) is the original NPay client and it builds the backbone of the network. However, it downloads and stores the entire history of NPay transactions; depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more. Thankfully you only have to do this once.


Running
---------------------
The following are some helpful notes on how to run NPay on your native platform.

### Unix

Unpack the files into a directory and run:

- bin/32/npay-qt (GUI, 32-bit) or bin/32/npayd (headless, 32-bit)
- bin/64/npay-qt (GUI, 64-bit) or bin/64/npayd (headless, 64-bit)

- [Ubuntu 16.04 Wallet Download](http://downloads.npay.network/linux/linux.zip)

### Windows

Unpack the files into a directory, and then run npay-qt.exe.

- [Windows QT Wallet Download](http://downloads.npay.network/windows/windows.zip)

### OSX

Drag NPay-Qt to your applications folder, and then run NPay-Qt.

- [OSX QT Wallet Download](http://downloads.npay.network/macos/macos.zip)

### Need Help?

* See the documentation at the [NPay Wiki](https://github.com/KryptoniteOU/NPay/wiki) ***TODO***
for help and more information.
* Ask for help on [BitcoinTalk](https://bitcointalk.org/index.php?topic=5075719.0) or on the [NPay Forum](http://npay.network/).
* Join one of our Telegram groups [NPay Network Official Group](https://t.me/npaynetwork).


Building
---------------------
The following are developer notes on how to build NPay on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [OSX Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Gitian Building Guide](gitian-building.md)


Development
---------------------
The NPay repo's [root README](https://github.com/KryptoniteOU/NPay/blob/master/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Multiwallet Qt Development](multiwallet-qt.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Source Code Documentation (External Link)](https://dev.visucore.com/bitcoin/doxygen/) ***TODO***
- [Translation Process](translation_process.md)
- [Unit Tests](unit-tests.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Dnsseed Policy](dnsseed-policy.md)

### Resources

* Discuss on the [BitcoinTalk](https://bitcointalk.org/index.php?topic=5075719.0) .
Join the [NPay Network Official Group] Telegram groups [NPay Network Official Group](https://t.me/npaynetwork).

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [Files](files.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)


License
---------------------
Distributed under the [MIT/X11 software license](http://www.opensource.org/licenses/mit-license.php).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
