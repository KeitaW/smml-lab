```
===== CPU Information =====
Architecture:                         x86_64
CPU op-mode(s):                       32-bit, 64-bit
Address sizes:                        46 bits physical, 48 bits virtual
Byte Order:                           Little Endian
CPU(s):                               96
On-line CPU(s) list:                  0-95
Vendor ID:                            GenuineIntel
Model name:                           Intel(R) Xeon(R) Platinum 8275CL CPU @ 3.00GHz
CPU family:                           6
Model:                                85
Thread(s) per core:                   2
Core(s) per socket:                   24
Socket(s):                            2
Stepping:                             7
BogoMIPS:                             5999.99
Flags:                                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq monitor ssse3 fma cx16 pcid sse4_1 sse4_2 x2apicmovbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch pti fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx avx512favx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves ida arat pku ospke
Hypervisor vendor:                    KVM
Virtualization type:                  full
L1d cache:                            1.5 MiB (48 instances)
L1i cache:                            1.5 MiB (48 instances)
L2 cache:                             48 MiB (48 instances)
L3 cache:                             71.5 MiB (2 instances)
NUMA node(s):                         2
NUMA node0 CPU(s):                    0-23,48-71
NUMA node1 CPU(s):                    24-47,72-95
Vulnerability Gather data sampling:   Unknown: Dependent on hypervisor status
Vulnerability Itlb multihit:          KVM: Mitigation: VMX unsupported
Vulnerability L1tf:                   Mitigation; PTE Inversion
Vulnerability Mds:                    Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state unknown
Vulnerability Meltdown:               Mitigation; PTI
Vulnerability Mmio stale data:        Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state unknown
Vulnerability Reg file data sampling: Not affected
Vulnerability Retbleed:               Vulnerable
Vulnerability Spec rstack overflow:   Not affected
Vulnerability Spec store bypass:      Vulnerable
Vulnerability Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:             Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Retpoline
Vulnerability Srbds:                  Not affected
Vulnerability Tsx async abort:        Not affected

===== Memory Layout =====
H/W path      Device           Class          Description
=========================================================
/0/0                           memory         64KiB BIOS
/0/4/6                         memory         1536KiB L1 cache
/0/4/7                         memory         24MiB L2 cache
/0/4/8                         memory         35MiB L3 cache
/0/5/9                         memory         1536KiB L1 cache
/0/5/a                         memory         24MiB L2 cache
/0/5/b                         memory         35MiB L3 cache
/0/c                           memory         1152GiB System Memory
/0/c/0                         memory         576GiB DIMM DDR4 Static column Pseudo-static Synchronous Window DRAM 3200 MHz (0.3 ns)
/0/c/1                         memory         576GiB DIMM DDR4 Static column Pseudo-static Synchronous Window DRAM 3200 MHz (0.3 ns)

===== Block Devices =====
NAME                 MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0                  7:0    0  89.4M  1 loop /snap/lxd/31333
loop1                  7:1    0  73.9M  1 loop /snap/core22/1748
loop2                  7:2    0  26.3M  1 loop /snap/amazon-ssm-agent/9881
loop3                  7:3    0  63.7M  1 loop /snap/core20/2434
loop4                  7:4    0  44.4M  1 loop /snap/snapd/23545
loop5                  7:5    0  63.7M  1 loop /snap/core20/2496
loop6                  7:6    0  27.2M  1 loop /snap/amazon-ssm-agent/11232
nvme0n1              259:0    0    40G  0 disk
├─nvme0n1p1          259:9    0  39.9G  0 part /
├─nvme0n1p14         259:10   0     4M  0 part
└─nvme0n1p15         259:11   0   106M  0 part /boot/efi
nvme5n1              259:1    0 875.4G  0 disk
└─vg.01-lv_ephemeral 252:0    0   6.8T  0 lvm  /opt/dlami/nvme
nvme6n1              259:2    0 875.4G  0 disk
└─vg.01-lv_ephemeral 252:0    0   6.8T  0 lvm  /opt/dlami/nvme
nvme8n1              259:3    0 875.4G  0 disk
└─vg.01-lv_ephemeral 252:0    0   6.8T  0 lvm  /opt/dlami/nvme
nvme7n1              259:4    0 875.4G  0 disk
└─vg.01-lv_ephemeral 252:0    0   6.8T  0 lvm  /opt/dlami/nvme
nvme4n1              259:5    0 875.4G  0 disk
└─vg.01-lv_ephemeral 252:0    0   6.8T  0 lvm  /opt/dlami/nvme
nvme1n1              259:6    0 875.4G  0 disk
└─vg.01-lv_ephemeral 252:0    0   6.8T  0 lvm  /opt/dlami/nvme
nvme3n1              259:7    0 875.4G  0 disk
└─vg.01-lv_ephemeral 252:0    0   6.8T  0 lvm  /opt/dlami/nvme
nvme2n1              259:8    0 875.4G  0 disk
└─vg.01-lv_ephemeral 252:0    0   6.8T  0 lvm  /opt/dlami/nvme

===== NVMe Devices =====
Node                  SN                   Model                                    Namespace Usage                      Format           FW Rev
--------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
/dev/nvme0n1          vol0e7a386d229068f40 Amazon Elastic Block Store               1          42.95  GB /  42.95  GB    512   B +  0 B   1.0
/dev/nvme1n1          AWS22DB2F78D912E813D Amazon EC2 NVMe Instance Storage         1         940.00  GB / 940.00  GB    512   B +  0 B   0
/dev/nvme2n1          AWS1C132F15D96E510E5 Amazon EC2 NVMe Instance Storage         1         940.00  GB / 940.00  GB    512   B +  0 B   0
/dev/nvme3n1          AWS22675744C3FB74DC1 Amazon EC2 NVMe Instance Storage         1         940.00  GB / 940.00  GB    512   B +  0 B   0
/dev/nvme4n1          AWS1C14A76C41F18B8D4 Amazon EC2 NVMe Instance Storage         1         940.00  GB / 940.00  GB    512   B +  0 B   0
/dev/nvme5n1          AWS2210CE3FAD7403F7A Amazon EC2 NVMe Instance Storage         1         940.00  GB / 940.00  GB    512   B +  0 B   0
/dev/nvme6n1          AWS220BC629AA8783728 Amazon EC2 NVMe Instance Storage         1         940.00  GB / 940.00  GB    512   B +  0 B   0
/dev/nvme7n1          AWS1AD75AFA7F9559DA5 Amazon EC2 NVMe Instance Storage         1         940.00  GB / 940.00  GB    512   B +  0 B   0
/dev/nvme8n1          AWS1355A08E2A05AB4CA Amazon EC2 NVMe Instance Storage         1         940.00  GB / 940.00  GB    512   B +  0 B   0

Detecting first 'Amazon EC2 NVMe Instance Storage' device...
Found device: /dev/nvme1n1

===== Running fio Sequential Read Test =====
seqread: (g=0): rw=read, bs=(R) 1024KiB-1024KiB, (W) 1024KiB-1024KiB, (T) 1024KiB-1024KiB, ioengine=libaio, iodepth=32
fio-3.28
Starting 1 process

seqread: (groupid=0, jobs=1): err= 0: pid=10085: Tue Feb 25 01:28:32 2025
  read: IOPS=2585, BW=2586MiB/s (2711MB/s)(4096MiB/1584msec)
    slat (usec): min=27, max=10145, avg=384.10, stdev=235.69
    clat (usec): min=4671, max=29779, avg=11934.62, stdev=4874.57
     lat (usec): min=4963, max=30505, avg=12318.83, stdev=5028.75
    clat percentiles (usec):
     |  1.00th=[ 8848],  5.00th=[ 8979], 10.00th=[ 8979], 20.00th=[ 9110],
     | 30.00th=[ 9110], 40.00th=[ 9110], 50.00th=[ 9241], 60.00th=[ 9241],
     | 70.00th=[ 9372], 80.00th=[20055], 90.00th=[20579], 95.00th=[20841],
     | 99.00th=[21103], 99.50th=[21103], 99.90th=[27395], 99.95th=[28705],
     | 99.99th=[29754]
   bw (  MiB/s): min= 1484, max= 3386, per=97.94%, avg=2532.67, stdev=965.93, samples=3
   iops        : min= 1484, max= 3386, avg=2532.67, stdev=965.93, samples=3
  lat (msec)   : 10=74.49%, 20=3.91%, 50=21.61%
  cpu          : usr=0.32%, sys=10.68%, ctx=3878, majf=0, minf=8203
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=0.4%, 32=99.2%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.1%, 64=0.0%, >=64=0.0%
     issued rwts: total=4096,0,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=32

Run status group 0 (all jobs):
   READ: bw=2586MiB/s (2711MB/s), 2586MiB/s-2586MiB/s (2711MB/s-2711MB/s), io=4096MiB (4295MB), run=1584-1584msec

Disk stats (read/write):
  nvme1n1: ios=27109/0, merge=0/0, ticks=168848/0, in_queue=168849, util=93.22%

===== Running fio Sequential Write Test =====
seqwrite: (g=0): rw=write, bs=(R) 1024KiB-1024KiB, (W) 1024KiB-1024KiB, (T) 1024KiB-1024KiB, ioengine=libaio, iodepth=32
fio-3.28
Starting 1 process

seqwrite: (groupid=0, jobs=1): err= 0: pid=10191: Tue Feb 25 01:28:35 2025
  write: IOPS=1264, BW=1265MiB/s (1326MB/s)(4096MiB/3238msec); 0 zone resets
    slat (usec): min=62, max=5500, avg=784.54, stdev=275.75
    clat (usec): min=10505, max=47602, avg=24481.13, stdev=2730.14
     lat (usec): min=10603, max=48646, avg=25265.85, stdev=2787.24
    clat percentiles (usec):
     |  1.00th=[20579],  5.00th=[22152], 10.00th=[22676], 20.00th=[23200],
     | 30.00th=[23462], 40.00th=[23987], 50.00th=[23987], 60.00th=[24249],
     | 70.00th=[24511], 80.00th=[24773], 90.00th=[25560], 95.00th=[29492],
     | 99.00th=[37487], 99.50th=[38011], 99.90th=[43254], 99.95th=[45351],
     | 99.99th=[47449]
   bw (  MiB/s): min= 1228, max= 1294, per=100.00%, avg=1268.33, stdev=25.09, samples=6
   iops        : min= 1228, max= 1294, avg=1268.33, stdev=25.09, samples=6
  lat (msec)   : 20=0.66%, 50=99.34%
  cpu          : usr=5.59%, sys=5.19%, ctx=3853, majf=0, minf=13
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=0.4%, 32=99.2%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.1%, 64=0.0%, >=64=0.0%
     issued rwts: total=0,4096,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=32

Run status group 0 (all jobs):
  WRITE: bw=1265MiB/s (1326MB/s), 1265MiB/s-1265MiB/s (1326MB/s-1326MB/s), io=4096MiB (4295MB), run=3238-3238msec

Disk stats (read/write):
  nvme1n1: ios=0/31582, merge=0/0, ticks=0/381475, in_queue=381475, util=96.22%

===== Running fio Random Read Test =====
randread: (g=0): rw=randread, bs=(R) 4096B-4096B, (W) 4096B-4096B, (T) 4096B-4096B, ioengine=libaio, iodepth=64
...
fio-3.28
Starting 4 processes

randread: (groupid=0, jobs=4): err= 0: pid=10298: Tue Feb 25 01:28:39 2025
  read: IOPS=335k, BW=1308MiB/s (1371MB/s)(4096MiB/3132msec)
    slat (nsec): min=1490, max=8983.4k, avg=2735.59, stdev=11783.43
    clat (usec): min=17, max=10392, avg=758.45, stdev=245.18
     lat (usec): min=166, max=10395, avg=761.25, stdev=246.42
    clat percentiles (usec):
     |  1.00th=[  371],  5.00th=[  445], 10.00th=[  478], 20.00th=[  537],
     | 30.00th=[  578], 40.00th=[  627], 50.00th=[  701], 60.00th=[  857],
     | 70.00th=[  971], 80.00th=[ 1012], 90.00th=[ 1045], 95.00th=[ 1090],
     | 99.00th=[ 1172], 99.50th=[ 1221], 99.90th=[ 1418], 99.95th=[ 1565],
     | 99.99th=[ 4883]
   bw (  MiB/s): min=  975, max= 1643, per=100.00%, avg=1323.04, stdev=76.66, samples=24
   iops        : min=249704, max=420622, avg=338699.33, stdev=19624.51, samples=24
  lat (usec)   : 20=0.01%, 250=0.05%, 500=12.98%, 750=41.16%, 1000=23.23%
  lat (msec)   : 2=22.56%, 4=0.01%, 10=0.01%, 20=0.01%
  cpu          : usr=11.57%, sys=16.62%, ctx=169299, majf=0, minf=306
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=0.1%, 32=0.1%, >=64=100.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.1%, >=64=0.0%
     issued rwts: total=1048576,0,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=64

Run status group 0 (all jobs):
   READ: bw=1308MiB/s (1371MB/s), 1308MiB/s-1308MiB/s (1371MB/s-1371MB/s), io=4096MiB (4295MB), run=3132-3132msec

Disk stats (read/write):
  nvme1n1: ios=1046706/0, merge=0/0, ticks=778250/0, in_queue=778249, util=96.84%

===== Running fio Random Write Test =====
randwrite: (g=0): rw=randwrite, bs=(R) 4096B-4096B, (W) 4096B-4096B, (T) 4096B-4096B, ioengine=libaio, iodepth=64
...
fio-3.28
Starting 4 processes

randwrite: (groupid=0, jobs=4): err= 0: pid=10407: Tue Feb 25 01:28:43 2025
  write: IOPS=269k, BW=1051MiB/s (1102MB/s)(4096MiB/3898msec); 0 zone resets
    slat (nsec): min=1493, max=417843, avg=1898.80, stdev=2449.07
    clat (usec): min=152, max=5266, avg=948.56, stdev=279.87
     lat (usec): min=185, max=5268, avg=950.52, stdev=279.81
    clat percentiles (usec):
     |  1.00th=[  545],  5.00th=[  611], 10.00th=[  652], 20.00th=[  693],
     | 30.00th=[  734], 40.00th=[  775], 50.00th=[  848], 60.00th=[  979],
     | 70.00th=[ 1254], 80.00th=[ 1270], 90.00th=[ 1287], 95.00th=[ 1303],
     | 99.00th=[ 1319], 99.50th=[ 1434], 99.90th=[ 1942], 99.95th=[ 2606],
     | 99.99th=[ 5211]
   bw (  MiB/s): min=  781, max= 1317, per=100.00%, avg=1081.71, stdev=61.17, samples=28
   iops        : min=200132, max=337406, avg=276918.00, stdev=15659.62, samples=28
  lat (usec)   : 250=0.01%, 500=0.25%, 750=34.92%, 1000=25.94%
  lat (msec)   : 2=38.80%, 4=0.06%, 10=0.02%
  cpu          : usr=9.17%, sys=13.74%, ctx=234553, majf=0, minf=48
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=0.1%, 32=0.1%, >=64=100.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.1%, >=64=0.0%
     issued rwts: total=0,1048576,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=64

Run status group 0 (all jobs):
  WRITE: bw=1051MiB/s (1102MB/s), 1051MiB/s-1051MiB/s (1102MB/s-1102MB/s), io=4096MiB (4295MB), run=3898-3898msec

Disk stats (read/write):
  nvme1n1: ios=0/1042902, merge=0/0, ticks=0/975672, in_queue=975672, util=97.41%

Performance tests completed.
```