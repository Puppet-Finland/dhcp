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

    firewall { "007 ipv4 accept dhcp":
        provider => 'iptables',
        chain => 'INPUT',
        proto => 'udp',
        action => 'accept',
        iniface => $iniface ? {
            'any' => undef,
            default => $iniface,
        },
        sport => [67,68],
        dport => [67,68],
    }

    firewall { "007 ipv6 accept dhcp":
        provider => 'ip6tables',
        chain => 'INPUT',
        proto => 'udp',
        action => 'accept',
        iniface => $iniface ? {
            'any' => undef,
            default => $iniface,
        },
        sport => [67,68],
        dport => [67,68],
    }
}
