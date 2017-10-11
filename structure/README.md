# Atlas [![Build Status][svg-travis]][travis]

[svg-travis]: https://travis-ci.com/grindrllc/atlas.svg?token=5Gs1pxpuoebYboxvYCyG&branch=develop

[travis]: https://travis-ci.com/grindrllc/atlas

<img align="right" width=150 height=150 src="atlas.png" alt="atlas">

> Atlas and his brother Menoetius sided with the Titans in their war against the Olympians, the Titanomachy. When the
> Titans were defeated, many of them were confined to Tartarus, but Zeus condemned Atlas to stand at the western edge of
> Gaia (the Earth) and hold up The Heavens on his shoulders, to prevent the two from resuming their primordial embrace.
> Thus, he was Atlas Telamon, "enduring Atlas," and became a doublet of Coeus, the embodiment of the celestial axis around
> which the heavens revolve.

A network layout well-suited to most organizational needs.


## Vagrant

This project comes with batteries included with [Vagrant][vagrant]. Please
[read the docs on how to use Atlas in Vagrant][vagrant-wiki].

If you have vmware fusion, set `export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"`

## AWS Accounts

Each Atlas Hub or Environment is constrained to live only in a single AWS account. These account IDs aren't very
intelligible, so here is a table relating them back to intelligible names:

<table>
  <tbody>
    <tr>
      <th>Title</th>
      <th>Identifier</th>
      <th>Account ID</th>
    </tr>
    <tr>
      <td><del>Development</del></td>
      <td><code><del>dev</del></code></td>
      <td><code><del>780453558463</del></code></td>
    </tr>
    <tr>
      <td>Development</td>
      <td><code>grindr-development</code></td>
      <td><code>202004573189</code></td>
    </tr>
    <tr>
      <td>Staging</td>
      <td><code>grindr-staging</code></td>
      <td><code>886703752586</code></td>
    </tr>
    <tr>
      <td>Legacy</td>
      <td><code>grindr-legacy</code></td>
      <td><code>284224159432</code></td>
    </tr>
    <tr>
      <td>Production</td>
      <td><code>grindr-production</code></td>
      <td><code>058144102190</code></td>
    </tr>
  </tbody>
</table>

 [vagrant]: https://vagrantup.com
 [vagrant-wiki]: https://github.com/grindrllc/atlas/wiki/Vagrant
 [virtualbox]: https://virtualbox.org
 [terraform]: https://terraform.io
 [ansible]: https://ansible.com
