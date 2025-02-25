===== CPU Information =====
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          46 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   96
  On-line CPU(s) list:    0-95
Vendor ID:                GenuineIntel
  Model name:             Intel(R) Xeon(R) Platinum 8275CL CPU @ 3.00GHz
    CPU family:           6
    Model:                85
    Thread(s) per core:   2
    Core(s) per socket:   24
    Socket(s):            2
    Stepping:             7
    BogoMIPS:             5999.99
    Flags:                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm const
                          ant_tsc arch_perfmon rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq monitor ssse3 fma cx16 pcid sse4_1
                          sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch pti fsgsbase tsc_adjust bmi1
                          avx2 smep bmi2 erms invpcid mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves
                           ida arat pku ospke
Virtualization features:
  Hypervisor vendor:      KVM
  Virtualization type:    full
Caches (sum of all):
  L1d:                    1.5 MiB (48 instances)
  L1i:                    1.5 MiB (48 instances)
  L2:                     48 MiB (48 instances)
  L3:                     71.5 MiB (2 instances)
NUMA:
  NUMA node(s):           2
  NUMA node0 CPU(s):      0-23,48-71
  NUMA node1 CPU(s):      24-47,72-95
Vulnerabilities:
  Gather data sampling:   Unknown: Dependent on hypervisor status
  Itlb multihit:          KVM: Mitigation: VMX unsupported
  L1tf:                   Mitigation; PTE Inversion
  Mds:                    Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state unknown
  Meltdown:               Mitigation; PTI
  Mmio stale data:        Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state unknown
  Reg file data sampling: Not affected
  Retbleed:               Vulnerable
  Spec rstack overflow:   Not affected
  Spec store bypass:      Vulnerable
  Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:             Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Retpoline
  Srbds:                  Not affected
  Tsx async abort:        Not affected

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
Jobs: 1 (f=1)
seqread: (groupid=0, jobs=1): err= 0: pid=12039: Tue Feb 25 02:02:36 2025
  read: IOPS=2590, BW=2591MiB/s (2717MB/s)(4096MiB/1581msec)
    slat (usec): min=31, max=3753, avg=383.28, stdev=190.63
    clat (usec): min=4608, max=21683, avg=11912.19, stdev=4858.72
     lat (usec): min=4907, max=22255, avg=12295.61, stdev=5013.61
    clat percentiles (usec):
     |  1.00th=[ 8848],  5.00th=[ 8979], 10.00th=[ 8979], 20.00th=[ 9110],
     | 30.00th=[ 9110], 40.00th=[ 9110], 50.00th=[ 9110], 60.00th=[ 9241],
     | 70.00th=[ 9372], 80.00th=[20055], 90.00th=[20579], 95.00th=[20841],
     | 99.00th=[21103], 99.50th=[21365], 99.90th=[21365], 99.95th=[21365],
     | 99.99th=[21627]
   bw (  MiB/s): min= 1482, max= 3398, per=97.99%, avg=2538.67, stdev=973.12, samples=3
   iops        : min= 1482, max= 3398, avg=2538.67, stdev=973.12, samples=3
  lat (msec)   : 10=74.15%, 20=4.69%, 50=21.17%
  cpu          : usr=0.51%, sys=11.90%, ctx=4090, majf=0, minf=8204
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=0.4%, 32=99.2%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.1%, 64=0.0%, >=64=0.0%
     issued rwts: total=4096,0,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=32

Run status group 0 (all jobs):
   READ: bw=2591MiB/s (2717MB/s), 2591MiB/s-2591MiB/s (2717MB/s-2717MB/s), io=4096MiB (4295MB), run=1581-1581msec

Disk stats (read/write):
  nvme1n1: ios=27169/0, merge=0/0, ticks=168554/0, in_queue=168554, util=93.15%

===== Running fio Sequential Write Test =====
seqwrite: (g=0): rw=write, bs=(R) 1024KiB-1024KiB, (W) 1024KiB-1024KiB, (T) 1024KiB-1024KiB, ioengine=libaio, iodepth=32
fio-3.28
Starting 1 process
Jobs: 1 (f=1): [W(1)][-.-%][w=1275MiB/s][w=1275 IOPS][eta 00m:00s]
seqwrite: (groupid=0, jobs=1): err= 0: pid=12146: Tue Feb 25 02:02:40 2025
  write: IOPS=1276, BW=1277MiB/s (1339MB/s)(4096MiB/3208msec); 0 zone resets
    slat (usec): min=59, max=4992, avg=778.27, stdev=241.52
    clat (usec): min=10688, max=39755, avg=24253.94, stdev=2336.76
     lat (usec): min=10768, max=40465, avg=25032.39, stdev=2386.83
    clat percentiles (usec):
     |  1.00th=[21103],  5.00th=[21890], 10.00th=[22414], 20.00th=[23200],
     | 30.00th=[23462], 40.00th=[23987], 50.00th=[23987], 60.00th=[24249],
     | 70.00th=[24511], 80.00th=[24773], 90.00th=[25297], 95.00th=[26084],
     | 99.00th=[38011], 99.50th=[39060], 99.90th=[39584], 99.95th=[39584],
     | 99.99th=[39584]
   bw (  MiB/s): min= 1240, max= 1292, per=99.62%, avg=1272.00, stdev=18.93, samples=6
   iops        : min= 1240, max= 1292, avg=1272.00, stdev=18.93, samples=6
  lat (msec)   : 20=0.66%, 50=99.34%
  cpu          : usr=5.89%, sys=3.77%, ctx=3991, majf=0, minf=10
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=0.4%, 32=99.2%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.1%, 64=0.0%, >=64=0.0%
     issued rwts: total=0,4096,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=32

Run status group 0 (all jobs):
  WRITE: bw=1277MiB/s (1339MB/s), 1277MiB/s-1277MiB/s (1339MB/s-1339MB/s), io=4096MiB (4295MB), run=3208-3208msec

Disk stats (read/write):
  nvme1n1: ios=0/31681, merge=0/0, ticks=0/381232, in_queue=381232, util=96.22%

===== Running fio Random Read Test =====
randread: (g=0): rw=randread, bs=(R) 4096B-4096B, (W) 4096B-4096B, (T) 4096B-4096B, ioengine=libaio, iodepth=64
...
fio-3.28
Starting 4 processes
Jobs: 2 (f=2): [r(1),_(2),r(1)][-.-%][r=979MiB/s][r=251k IOPS][eta 00m:00s]
randread: (groupid=0, jobs=4): err= 0: pid=12251: Tue Feb 25 02:02:43 2025
  read: IOPS=335k, BW=1310MiB/s (1374MB/s)(4096MiB/3127msec)
    slat (nsec): min=1483, max=583597, avg=4651.81, stdev=10174.98
    clat (usec): min=149, max=1898, avg=645.62, stdev=220.98
     lat (usec): min=152, max=1922, avg=650.34, stdev=223.78
    clat percentiles (usec):
     |  1.00th=[  247],  5.00th=[  302], 10.00th=[  351], 20.00th=[  420],
     | 30.00th=[  486], 40.00th=[  553], 50.00th=[  701], 60.00th=[  742],
     | 70.00th=[  783], 80.00th=[  824], 90.00th=[  906], 95.00th=[  979],
     | 99.00th=[ 1156], 99.50th=[ 1237], 99.90th=[ 1401], 99.95th=[ 1467],
     | 99.99th=[ 1614]
   bw (  MiB/s): min= 1369, max= 2027, per=100.00%, avg=1627.36, stdev=62.40, samples=20
   iops        : min=350576, max=518932, avg=416605.20, stdev=15974.48, samples=20
  lat (usec)   : 250=1.13%, 500=31.45%, 750=29.09%, 1000=34.08%
  lat (msec)   : 2=4.26%
  cpu          : usr=12.22%, sys=21.82%, ctx=208857, majf=0, minf=315
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=0.1%, 32=0.1%, >=64=100.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.1%, >=64=0.0%
     issued rwts: total=1048576,0,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=64

Run status group 0 (all jobs):
   READ: bw=1310MiB/s (1374MB/s), 1310MiB/s-1310MiB/s (1374MB/s-1374MB/s), io=4096MiB (4295MB), run=3127-3127msec

Disk stats (read/write):
  nvme1n1: ios=1047802/0, merge=0/0, ticks=610691/0, in_queue=610690, util=96.84%

===== Running fio Random Write Test =====
randwrite: (g=0): rw=randwrite, bs=(R) 4096B-4096B, (W) 4096B-4096B, (T) 4096B-4096B, ioengine=libaio, iodepth=64
...
fio-3.28
Starting 4 processes
Jobs: 4 (f=4): [w(4)][-.-%][w=782MiB/s][w=200k IOPS][eta 00m:00s]
randwrite: (groupid=0, jobs=4): err= 0: pid=12366: Tue Feb 25 02:02:48 2025
  write: IOPS=268k, BW=1048MiB/s (1099MB/s)(4096MiB/3909msec); 0 zone resets
    slat (nsec): min=1485, max=25714, avg=1808.00, stdev=590.63
    clat (usec): min=182, max=6949, avg=951.20, stdev=285.59
     lat (usec): min=187, max=6951, avg=953.07, stdev=285.59
    clat percentiles (usec):
     |  1.00th=[  553],  5.00th=[  619], 10.00th=[  652], 20.00th=[  701],
     | 30.00th=[  734], 40.00th=[  783], 50.00th=[  840], 60.00th=[  971],
     | 70.00th=[ 1254], 80.00th=[ 1270], 90.00th=[ 1287], 95.00th=[ 1303],
     | 99.00th=[ 1336], 99.50th=[ 1483], 99.90th=[ 2057], 99.95th=[ 2278],
     | 99.99th=[ 6915]
   bw (  MiB/s): min=  782, max= 1313, per=100.00%, avg=1079.21, stdev=59.90, samples=28
   iops        : min=200206, max=336298, avg=276278.00, stdev=15335.26, samples=28
  lat (usec)   : 250=0.01%, 500=0.19%, 750=33.71%, 1000=27.50%
  lat (msec)   : 2=38.46%, 4=0.11%, 10=0.02%
  cpu          : usr=9.22%, sys=13.44%, ctx=219973, majf=0, minf=50
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=0.1%, 32=0.1%, >=64=100.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.1%, >=64=0.0%
     issued rwts: total=0,1048576,0,0 short=0,0,0,0 dropped=0,0,0,0
     latency   : target=0, window=0, percentile=100.00%, depth=64

Run status group 0 (all jobs):
  WRITE: bw=1048MiB/s (1099MB/s), 1048MiB/s-1048MiB/s (1099MB/s-1099MB/s), io=4096MiB (4295MB), run=3909-3909msec

Disk stats (read/write):
  nvme1n1: ios=0/1040669, merge=0/0, ticks=0/975134, in_queue=975133, util=97.43%

===== Running sysbench Memory Write Performance Test =====
sysbench 1.0.20 (using system LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Running memory speed test with the following options:
  block size: 1024KiB
  total size: 10240MiB
  operation: write
  scope: global

Initializing worker threads...

Threads started!

Total operations: 10240 (20740.68 per second)

10240.00 MiB transferred (20740.68 MiB/sec)


General statistics:
    total time:                          0.4922s
    total number of events:              10240

Latency (ms):
         min:                                    0.05
         avg:                                    0.05
         max:                                    0.08
         95th percentile:                        0.06
         sum:                                  489.54

Threads fairness:
    events (avg/stddev):           10240.0000/0.00
    execution time (avg/stddev):   0.4895/0.00


===== Running sysbench Memory Read Performance Test =====
sysbench 1.0.20 (using system LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Running memory speed test with the following options:
  block size: 1024KiB
  total size: 10240MiB
  operation: read
  scope: global

Initializing worker threads...

Threads started!

Total operations: 10240 (24785.37 per second)

10240.00 MiB transferred (24785.37 MiB/sec)


General statistics:
    total time:                          0.4117s
    total number of events:              10240

Latency (ms):
         min:                                    0.04
         avg:                                    0.04
         max:                                    0.07
         95th percentile:                        0.04
         sum:                                  409.26

Threads fairness:
    events (avg/stddev):           10240.0000/0.00
    execution time (avg/stddev):   0.4093/0.00


Performance tests completed.