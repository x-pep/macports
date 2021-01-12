# pEp software on MacPorts

<div style="padding: 0.4em; background: #20c750">
<b>Note:</b> pEp software on MacPorts is EXPERIMENTAL
</div>

### Repository setup

Add this to `${prefix}/etc/macports/sources.conf`:

    sudo open -e /opt/local/etc/macports/sources.conf

And add this line on top of the other source lines:

    https://software.pep.foundation/macports-pep.tar.gz

and if you want to hack the Portfiles locally, use a file:// URL;
using three slashes (file:///) for absolute paths:

    file://<path-to-checkout>

### Update

    sudo port selfupdate

### Installation

    sudo port install pep-adapter-thunderbird

### Usage

After installation, the pEp JSON Server should be available:

 - /opt/local/pEp/bin/pEp-mini-json-adapter

The binary is installed under /opt/local/bin (i.e. ${prefix}/bin), which is usually NOT on PATH, thus the mini adapter
lookup sequence will NOT find this binary by default.

To run the JSON server in a terminal and observe the debug output, start it as follows:

    /opt/local/pEp/bin/pEp-mini-json-adapter -l stderr -d1
 
### Uninstall

Uninstall the JSON server and its dependencies using MacPorts:

    sudo port uninstall pep-adapter-thunderbird libpep-adapter libpep-adapter-webserver libpep-engine-thunderbird libpep-etpan py-yml2

And finally you may want to remove the repository URL from `${prefix}/etc/macports/sources.conf`.

### Update policy

This repository is **not yet receiving** regular updates.

### Support

No public support for this MacPorts is offered, yet.
