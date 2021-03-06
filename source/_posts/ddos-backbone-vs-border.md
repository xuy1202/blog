---
title: DDoS检测 - 骨干网与企业安全边界的差异
date: 2016-01-14 21:52:33
tags:
 - nework security
 - DDoS

---

当前我们在做骨干网的DDoS实时检测，用以积累我们security visibility的能力。
同样是DDoS检测，在大网上来看和在防护安全边界来来，情况差异比较大，总结一下备忘。


# 数据

检测基于数据，先说数据差异。

## 数据类型

安全边界，几乎可以做全流量分析，而大网上，可获取的几乎只能是流量摘要数据。因此，安全边界可以做更细致的单包深度检测，或者会话重组找渗透，但是大网只能看统计特征。

## Point View vs. Scape View

企业看到针对自己这个点的数据，大网看的是整体。设定两个数量集规模M和N，M比N大2个数量级，安全边界看到的是M：N， 大网看到的是M：M。
因此，大网背景流量大很多，意味着噪音大很多，意味着很多即便是大攻击，但是淹没在更巨大的背景流量下，反而很小了，需要耗费更大的精力来定位分析。
但是大网的大背景流量在某些场景下也有优势，比如企业很难发现或者确认scanner，但是大网上由于自己的Scape View，确认Scanner反而简单。

## Full Data vs. Partial Data

企业安全边界对应Full Data很容易理解。大网上，Partial Data有两层含义：
1, 大网上看到针对一个IP的流量，只能是整体数据的一部分：很多我们采集点之外的数据我们是看不到的，更多大网采集点层级之下的数据我们也是看不到的
2，是进出数据的一边：在大网骨干路由上，来去的流量不一定是经过同一个地方，因此大网上某个点常常会看到单向流量

由于DDoS攻击流量基本上是全网窜，因此1带来的困难只是检测精细化的工程难度，2带来的更难处理，因为单向流量直接影响到了判定，看到一个IP只接受RST包，怎么确定这是RST Flood还是它是被Spoofed IP来SYN_ACK Flood攻击别人呢？

# 业务

## Manage Object／管理对象／资源／业务对象

企业都会有自己的资源／业务梳理，大网是没有的，我们当前可用的只有PDNS带给我们的domain-IP的映射关系，但是由于有CDN的存在，这个也存在部分问题。

## Baseline

企业既然可以梳理出MO，那也就可以根据MO来确定一个baseline，流量大小的也好，访问态势的也好，总有能力刻画一个常态的profile，但是大网监控，第一不可能有一个可梳理的baselien，第二，大网上异常太多，业务故障／业务调整／网络异常／攻击等等情况时刻都在发生，就算有baseline，那超出baseline部分的异常，仍旧是多到难以处理，所以有了baseline也要丢掉，直接去看数据中的强特征更靠谱。


# 目标

## 看到 vs. 防住
企业安全防护，工作的衡量标准就是自己保护对象的可用性，当攻击发生时能不能防住。
既然以保护对象的可用性作为最终衡量标准，那基本上都是抓大放小，告警基线可以根据自己资源能力来调整一个比较高的阈值，小攻击，探测性的攻击，能忽略就忽略，毕竟这些事情的处理也是要耗费安全运营的资源，大到可能影响业务的攻击一旦发生，那势必立即响应，以求安全。

我们做大网上的监控，更多的是想“看到”，大小都想看到。而且，更普遍的情况是，我们看到的小，只是因为我们的数据不全，只是在我们可见的范围内小，而实际攻击并不小。因此，我们看攻击没有“大小”的区别，只有“看到和看不到”的区别，我们要尽可能的“全看到”。

于此带来的一个最典型的工程处理方法上的区别就是，安全边界的TopN更重要，而大网监控的SpikeRate更重要，TopN突出的是当前面对的最大的是谁，SpikeRate表达的是变化最大的是谁。


