#
# == Class: dhcp::params
#
# Defines some variables based on the operating system
#
class dhcp::params {

    case $::kernel {
        'Linux': {
            # Nothing here atm
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
