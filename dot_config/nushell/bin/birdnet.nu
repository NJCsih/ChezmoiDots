export def netbird-detail [] {
    mut data = netbird status --json | from json
    $data.peers.details = ($data.peers.details
        | update lastWireguardHandshake { into datetime }
        | update lastStatusUpdate { into datetime }
        | update lastStatusUpdate { if (($in | into record | get year) < 10) { null } else { $in } }
        | update lastWireguardHandshake { if (($in | into record | get year) < 10) { null } else { $in } }
        | update transferReceived { into filesize }
        | update transferSent { into filesize }
        | update latency { into duration }
    )
    return $data
}

export def netbird-peers [] {
    netbird-detail | get peers.details | select fqdn netbirdIp status connectionType iceCandidateType iceCandidateEndpoint latency relayAddress lastWireguardHandshake
}
