#!/bin/sh
#*******************************************************************************
# Version 3.0 COPYRIGHT Ericsson 2019
#
# The copyright to the computer program(s) herein is the property of
# Ericsson Inc. The programs may be used and/or copied only with written
# permission from Ericsson Inc. or in accordance with the terms and
# conditions stipulated in the agreement/contract under which the
# program(s) have been supplied.
#
# Version 1 Disabled Swap
# Version 2 Set Swappiness to 0
# Version 3 removed swap from /etc/fstab or it will get re-enabled on a reboot.
#  Reboot will happen anytime OS patches are installed.
#  Also fixed shellcheck errors in script.
# Version 4 Fixed shellcheck error logs that were logged for cmds exiting with 0
#********************************************************************************

_LOGGER=/bin/logger
_ECHO=/bin/echo
_SED=/bin/sed
_GREP=/bin/grep
_WC=/usr/bin/wc

# GLOBAL VARIABLES
SCRIPT_NAME="${0}"
SERVICE_GROUP_NAME="mspm-listener"

error() {
    $_LOGGER -t "${SERVICE_GROUP_NAME}" -p user.err "( ${SCRIPT_NAME} ): $1"
}

info() {
    $_LOGGER -t "${SERVICE_GROUP_NAME}" -p user.notice "( ${SCRIPT_NAME} ): $1"
}

#enable_local_shutdown_service() {
#    info "Enabling local-shutdown service"
#
#    local_shutdown=%{local_shutdown}
#
#    if [ $(/sbin/pidof systemd) ] ; then
#        /bin/systemctl enable ${local_shutdown}.service
#        /bin/systemctl start ${local_shutdown}.service
#    elif [ $(/sbin/pidof init) ] ; then
#        chkconfig --add ${local_shutdown}
#        /etc/rc.d/init.d/${local_shutdown} start
#    else
#        echo "Error: Failed to find any services system."
#    fi
#     info "Finished enabling local-shutdown service"
#}

info "Running service group RPM postinstall"

#enable_local_shutdown_service

info "Completed service group RPM postinstall"

exit 0