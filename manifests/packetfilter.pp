#
# == Class: dhcp::packetfilter
#
# This class configures packetfilter to only let in traffic from specified 
# IP-addresses to the dhcp server.
#
class dhcp::packetfilter
(
    $iniface

) inherits dhcp::params
{


    $dhcp_iniface = $iniface ? {
        'any'   => undef,
        default => $iniface,
    }

    Firewall {
        chain    => 'INPUT',
        proto    => 'udp',
        action   => 'accept',
        sport    => [67,68],
        dport    => [67,68],
        iniface  => $dhcp_iniface,
    }

    firewall { '007 ipv4 accept dhcp':
        provider => 'iptables',
    }

    firewall { '007 ipv6 accept dhcp':
        provider => 'ip6tables',
    }
}
