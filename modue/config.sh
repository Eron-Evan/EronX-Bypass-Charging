################################################################################
#                        Module Configuration File                            #
################################################################################

# Should the module skip mounting its files to the system partition?
SKIPMOUNT=false    # false = mount normally, true = skip mounting

# Should the module load a prop file to set system properties?
PROPFILE=false     # false = no prop file, true = load prop file

# Should post-fs-data.sh run after filesystem mount?
POSTFSDATA=true    # true = run post-fs-data.sh early during boot

# Should service.sh run late, after boot completion?
LATESTARTSERVICE=true  # true = run service.sh late (ideal for services)

################################################################################
#                           @eron_evan | Bypass Charging                       #
################################################################################
