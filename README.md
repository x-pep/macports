# pEp software on MacPorts

<div style="padding: 0.4em; background: #20c750">
<b>Note:</b> pEp software on MacPorts is EXPERIMENTAL
</div>

### Repository setup

Add this to `${prefix}/etc/macports/sources.conf`:

    sudo open -e /opt/local/etc/macports/sources.conf

And add this line on top of the other source lines:

    https://software.pep.foundation/macports-pep.tar.gz

### Installation

    sudo port install pep-adapter-enigmail

### Usage

After installation, the pEp JSON Server should be available:

 - /opt/local/bin/pep-json-server

If you have `/opt/local/bin` in your PATH, then Enigmail will find it and it will override the internal server provided in the *pepmda* bundle. You may need to kill the previously started server.

To run the JSON server in a terminal and observe the debug output, start it as follows:

    /opt/local/bin/pep-json-server -l stderr -d1
 
### Uninstall

Uninstall the JSON server and its dependencies using MacPorts:

    sudo port uninstall pep-adapter-enigmail libpep-engine-enigmail libpep-etpan py-yml2

And finally you may want to remove the repository URL from `${prefix}/etc/macports/sources.conf`.

### Update policy

This repository is **not yet receiving** regular updates.

### Support

No public support for this MacPorts is offered, yet.
General support [for Enigmail](http://enigmail.net) is available.
