%feature label

% feature list covers:
% mean
% std: standard deviation
% di differential: the differential values between the two time
% sq square
% fft energy and entropy
classdef FL < uint32
enumeration
    label (1)
    
    ax_mean (2)
    ay_mean (3)
    az_mean (4)
    gx_mean (5)
    gy_mean (6)
    gz_mean (7)
    gvyx_mean (8)
    gvyy_mean (9)
    gvyz_mean (10)
    
    ax_std (11)
    ay_std (12)
    az_std (13)
    gx_std (14)
    gy_std (15)
    gz_std (16)
    gvyx_std (17)
    gvyy_std (18)
    gvyz_std (19)
    
    %-------
    
    sq_a_mean (20)
    sq_g_mean (21)
    sq_gvy_mean (22)
    
    sq_a_std (23)
    sq_g_std (24)
    sq_gvy_std (25)
    
    %++++++++
    
    di_ax_mean (26)
    di_ay_mean (27)
    di_az_mean (28)
    di_gx_mean (29)
    di_gy_mean (30)
    di_gz_mean (31)
    di_gvyx_mean (32)
    di_gvyy_mean (33)
    di_gvyz_mean (34)
    
    di_a_mean (35)
    di_g_mean (36)
    di_gvy_mean (37)
    
    di_ax_std (38)
    di_ay_std (39)
    di_az_std (40)
    di_gx_std (41)
    di_gy_std (42)
    di_gz_std (43)
    di_gvyx_std (44)
    di_gvyy_std (45)
    di_gvyz_std (46)
    
    di_a_std (47)
    di_g_std (48)
    di_gvy_std (49)
    
    %*********
    
    fft_ax_energy (50)
    fft_ay_energy (51)
    fft_az_energy (52)
    fft_ax_entropy (53)
    fft_ay_entropy (54)
    fft_az_entropy (55)

    
   end
end

