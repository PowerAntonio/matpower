function test_matpower(verbose)
%TEST_MATPOWER  Run all MATPOWER tests.
%   test_matpower runs all of the MATPOWER tests.
%   test_matpower(verbose) prints the details of the individual tests
%   if verbose is true.

%   MATPOWER
%   $Id$
%   by Ray Zimmerman, PSERC Cornell
%   Copyright (c) 2004 by Power System Engineering Research Center (PSERC)
%   See http://www.pserc.cornell.edu/matpower/ for more info.

if nargin < 1
    verbose = 0;
end

matpower_test_list = {
        't_loadcase', ...
        't_ext2int2ext', ...
        't_jacobian', ...
        't_hessian', ...
        't_hasPQcap', ...
        't_pf', ...
        't_opf_fmincon', ...
        't_opf_minopf', ...
        't_opf_pdipm', ...
        't_opf_scpdipm', ...
        't_opf_tspopf_pdipm', ...
        't_opf_tspopf_scpdipm', ...
        't_opf_tspopf_tralm', ...
        't_opf_constr', ...
        't_opf_lp_den', ...
        't_opf_lp_spr', ...
        't_opf_lp_spf', ...
        't_opf_dc_bpmpd', ...
        't_opf_dc_ot', ...
        't_opf_dc_pdipm', ...
        't_opf_dc_scpdipm', ...
        't_runopf_w_res', ...
        't_makePTDF', ...
        't_makeLODF', ...
        't_total_load', ...
        't_scale_load', ...
    };
market_test_list = {
        't_off2case', ...
        't_auction_minopf', ...
        't_auction_pdipm', ...
        't_auction_tspopf_pdipm', ...
        't_runmarket', ...
    };
sopf_test_list = {
        't_apply_contingency'
    };

%% MATPOWER base test
test_list = matpower_test_list;

%% smartmarket tests
if exist('runmarket') == 2
    test_list = {test_list{:}, market_test_list{:}};
end

%% sopf tests
if exist('apply_contingency') == 2
    test_list = {test_list{:}, sopf_test_list{:}};
end

t_run_tests( test_list, verbose );

return;
