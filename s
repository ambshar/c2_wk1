BUNDLE(1)                                                            BUNDLE(1)



NNAAMMEE
       bbuunnddllee - Ruby Dependency Management

SSYYNNOOPPSSIISS
       bbuunnddllee COMMAND [--no-color] [--verbose] [ARGS]

DDEESSCCRRIIPPTTIIOONN
       Bundler  manages  an aapppplliiccaattiioonn��ss ddeeppeennddeenncciieess through its entire life
       across many machines systematically and repeatably.

       See the bundler website _h_t_t_p_:_/_/_b_u_n_d_l_e_r_._i_o for  information  on  getting
       started, and Gemfile(5) for more information on the GGeemmffiillee format.

OOPPTTIIOONNSS
       ----nnoo--ccoolloorr
              Prints all output without color

       ----vveerrbboossee
              Prints out additional logging information

BBUUNNDDLLEE CCOOMMMMAANNDDSS
       We divide bbuunnddllee subcommands into primary commands and utilities.

PPRRIIMMAARRYY CCOOMMMMAANNDDSS
       bundle install(1) _b_u_n_d_l_e_-_i_n_s_t_a_l_l_._1_._h_t_m_l
              Install the gems specified by the GGeemmffiillee or GGeemmffiillee..lloocckk

       bundle update(1) _b_u_n_d_l_e_-_u_p_d_a_t_e_._1_._h_t_m_l
              Update dependencies to their latest versions

       bundle package(1) _b_u_n_d_l_e_-_p_a_c_k_a_g_e_._1_._h_t_m_l
              Package  the  .gem  files  required by your application into the
              vveennddoorr//ccaacchhee directory

       bundle exec(1) _b_u_n_d_l_e_-_e_x_e_c_._1_._h_t_m_l
              Execute a script in the context of the current bundle

       bundle config(1) _b_u_n_d_l_e_-_c_o_n_f_i_g_._1_._h_t_m_l
              Specify and read configuration options for bundler

       bbuunnddllee hheellpp((11))
              Displays detailed help for each subcommand

UUTTIILLIITTIIEESS
       bbuunnddllee cchheecckk((11))
              Determine whether the  requirements  for  your  application  are
              installed and available to bundler

       bbuunnddllee lliisstt((11))
              Show all of the gems in the current bundle

       bbuunnddllee sshhooww((11))
              Show the source location of a particular gem in the bundle

       bbuunnddllee oouuttddaatteedd((11))
              Show all of the outdated gems in the current bundle

       bbuunnddllee ccoonnssoollee((11))
              Start an IRB session in the context of the current bundle

       bbuunnddllee ooppeenn((11))
              Open an installed gem in the editor

       bbuunnddllee vviizz((11))
              Generate a visual representation of your dependencies

       bbuunnddllee iinniitt((11))
              Generate a simple GGeemmffiillee, placed in the current directory

       bbuunnddllee ggeemm((11))
              Create a simple gem, suitable for development with bundler

       bundle platform(1) _b_u_n_d_l_e_-_p_l_a_t_f_o_r_m_._1_._h_t_m_l
              Displays platform compatibility information

       bbuunnddllee cclleeaann((11))
              Cleans up unused gems in your bundler directory

OOBBSSOOLLEETTEE
       These commands are obsolete and should no longer be used

       �   bbuunnddllee lloocckk((11))

       �   bbuunnddllee uunnlloocckk((11))

       �   bbuunnddllee ccaacchhee((11))






                                 January 2014                        BUNDLE(1)
