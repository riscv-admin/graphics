# RISC-V Graphics and ML SIG meeting on 6th January 2021

- Time: 19:00 (Barcelona time)
- Attendees:
    * Abel Bernabeu (Esperanto Technologies, Chair)
    * Michael Wong (Codeplay, Chair from Datacenter SIG)
    * Mick Thomas Lim (Individual contributor)
    * Mehmet Oguz Derin (Individual contributor)
    * Jeff Scheel (RISC-V)
    * Julie Schwartz (Bluespec, Massey University)
    * Peter Glaskowsky (Esperanto Technologies)
    * Richard Van (Futurewei)
    * Torbjørn Ness (Nordic Semiconductor)
- Recorded: yes, on the chair's computer

## Agenda

The session was focused on ML.

* Introductions (DONE)
* ML frameworks: the case for TVM support (DONE)
* Status of the RISC-V backend on TVM (DONE)
* Gap analysis for ML: a practical approach (DONE)

## ML frameworks: the case for TVM support

TVM was ranked as third in terms of interest by our members on the survey
we did a few weeks ago. The voted options were:

- Tensorflow / Tensorflow Lite: 7 votes
- PyTorch / Glow: 5 votes
- TVM: 4 votes
- TLX: 1 vote

While I understand why people voted for the frameworks most of our
employers are using, I ask our members to think of the community's
interest by considering other options. In that regard I wanted to
highlight the reason why I think TVM is an excellent option to
support (see the [presention](https://github.com/riscv-admin/graphics/blob/main/minutes/presentation-2022-01-06-ml-centric.pdf)).

First of all, TVM being at the intersection between compilers and ML
allows us to leverage the know-how on compilers from the RISC-V software
ecosystem. Supporting an official TVM backend for RISC-V will require
more compiler know-how than supporting a Tensorflow/Tensorflow Lite
or PyTorch/Glow backend would. However, as a community we can pay the
price and enjoy the advantages, whereas some members individually may
not.

Second, tensor expressions (lambda expressions) are a very clean way
to express general purpose computations without embedding any scheduling
assumptions, even beyond the ML domain.

I provide an example of how computation and the schedule are provided
to the framework as orthogonal definitions. We see this with a very
simple scheduling example where operator fusion is enabled at will
without modifying the original computation definition.

Regarding the schedule, as of today an expert user is still needed
for defining such a schedule, but there are auto-tuning tools available
that help.

Also, it is remarkable that an input in the form of lambda expressions is
suitable for polyhedral compilers. The possibility of having a polyhedral
compiler is more of a promise than a reality as of today, though, because:
- The technology is still experimental (IMHO).
- A cost function is not always available.

## Gap analysis for ML: a practical approach

On the previous ML meeting we started discussing what workload to use as a
performance benchmark, with two options being considered:

 - Cherry-picking a model for inference, which could be ResNet50 (my
   preferred option)
 - Running a whole benchmark like MLPerf (Christoph Müllner).

I explain why running a whole benchmark is going to be difficult: likely it is
not trivial to get all the models working. ResNet50 is what I would advise
because it is very popular and also part of MLPerf (a move towards an industry
standard). Alternatively, MobileNet could be interesting as well.

Regarding the framework of choice for generating the ML workload, Jeff Scheel
also points out that maybe focusing on a specific framework like TVM is
too narrow of an approach. We may be optimizing something that is not
realistic. I conceded this is possible and I prefer putting the workload
choice question through voting, so worst case our choice is a collective
mistake rather than just mine :-D

Also different criteria may be needed to be taken into account:

- What framework and benchmark yields the most results per unit of effort?
- What do members willing to invest resources want to prioritize?

## Volunteering areas

Here is the list of volunteering areas for anyone looking for contribution
opportunities:

- produce standard RISC-V code that runs on the Spike simulator for
  ResNet50 (or MobileNet). Try the TVM framework or any other of
  your choice.

- tell us about ML frameworks other than TVM in some of our next sessions.

- suggest topics for our next meetings.

- help with the gap analysis plan write up.
