#  File: Makefile
#
#  Copyright 2023 NXP
#
#  This software file (the File) is distributed by NXP
#  under the terms of the GNU General Public License Version 2, June 1991
#  (the License).  You may use, redistribute and/or modify the File in
#  accordance with the terms and conditions of the License, a copy of which
#  is available by writing to the Free Software Foundation, Inc.,
#  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA or on the
#  worldwide web at http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
#
#  THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE
#  ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
#  this warranty disclaimer.
#

INSTALLDIR ?= wlan_fw

install:

	@if [ ! -d $(INSTALLDIR) ]; then \
		mkdir $(INSTALLDIR); \
	fi

	install -m 0644 nxp/wifi_mod_para.conf $(INSTALLDIR)/
	install -m 0644 nxp/mfguart/helper_uart_3000000.bin $(INSTALLDIR)/

	install -m 0644 nxp/FwImage_8801_SD/* $(INSTALLDIR)/
	install -m 0644 nxp/FwImage_8987/* $(INSTALLDIR)/
	install -m 0644 nxp/FwImage_8997/* $(INSTALLDIR)/
	install -m 0644 nxp/FwImage_8997_SD/* $(INSTALLDIR)/
	install -m 0644 nxp/FwImage_9098_PCIE/* $(INSTALLDIR)/
	install -m 0644 nxp/FwImage_9098_SD/* $(INSTALLDIR)/
	install -m 0644 nxp/FwImage_IW416_SD/* $(INSTALLDIR)/
	install -m 0644 nxp/FwImage_IW612_SD/* $(INSTALLDIR)/

clean:
	-rm -rf $(INSTALLDIR)/

# End of file
