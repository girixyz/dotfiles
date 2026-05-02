function powerstat --description 'Check current power profile and turbo boost status'
    # Get current power profile
    set profile (powerprofilesctl get)
    
    # Check the actual kernel flag for Turbo Boost
    set turbo_flag (cat /sys/devices/system/cpu/intel_pstate/no_turbo)
    
    if test "$turbo_flag" = "0"
        set turbo_status "ENABLED (Allowed to boost, higher thermals)"
    else
        set turbo_status "DISABLED (Locked to base clock, cooler)"
    end
    
    # Print the results neatly formatted
    set_color cyan
    echo "=== Power & Thermal Status ==="
    set_color normal
    echo "Active Profile : $profile"
    echo "Turbo Boost    : $turbo_status"
end
