# Codis Proxy Module

An Atlas Module for deploying a number of [Codis][codis] proxy nodes in front of an arbitrary Redis Cluster set of
nodes. This module is designed to provide HA availability to Redis Cluster.

> **NOTE:** Codis makes Redis Cluster faster by making many writes asynchronous and allows pipelining, which Redis Cluster
> does not support.
