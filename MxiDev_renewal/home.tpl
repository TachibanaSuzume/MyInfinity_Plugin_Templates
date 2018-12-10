<div class="col-md-12">
    <div class="widget p-lg">
        <link rel="stylesheet" href="{$systemurl}modules/addons/renewal/library/templates/assets/css/home.css?v={$versionHash}">
        <div id="renewal">
        {if !empty($templates['product'])}
            <div class="row" id="home">
                <div class="col-md-12">
                    <div class="title-area">
                        <span class="badge">{$RENEWAL_LANG['home']['numberOfProduct'][0]} {$templates['product']|@count} {$RENEWAL_LANG['home']['numberOfProduct'][1]}</span>
                        <div class="home-title">{$RENEWAL_LANG['addonsName']}</div>
                    </div>
                    <div class="home-body">
                        <table class="table home-table">
                            <thead>
                                <tr>
                                    <th>{$RENEWAL_LANG['home']['productName']}</th>
                                    <th>{$RENEWAL_LANG['home']['domain']}</th>
                                    <th>{$RENEWAL_LANG['home']['billingcycle']}</th>
                                    <th>{$RENEWAL_LANG['home']['amount']}</th>
                                    <th>{$RENEWAL_LANG['home']['nextduedate']}</th>
                                    <th>{$RENEWAL_LANG['home']['operation']}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $templates['product'] as $key => $value}
                                <tr style="cursor:pointer;" onclick="clickableSafeRedirect(event, '{$systemurl}index.php?m=renewal&action=renew&sid={$value['sid']}', false)">
                                    <td>{$value['productname']}</td>
                                    {if !empty($value['domain'])}<td>{$value['domain']}</td>{else}<td>/</td>{/if}
                                    <td>{$value['billingcycle']}</td>
                                    <td>{$value['amount']}</td>
                                    <td>{$value['nextduedate']}</td>
                                    <td><button type="button" class="btn btn-sm btn-primary" onclick="window.location='{$systemurl}index.php?m=renewal&action=renew&sid={$value['sid']}'"><i class="md md-account-balance-wallet"></i> {$RENEWAL_LANG['home']['renew']}</a></td>
                                </tr>
                                {/foreach}                
                            </tbody>
                        </table>
                    </div> 
                </div>
            </div>
        {else}
            <div class="error-msg">
                <i class="fa fa-exclamation-triangle warning-img" aria-hidden="true"></i>
                <div class="error-text">{$RENEWAL_LANG['home']['canNotFindProduct']}</div>
                <a href="clientarea.php">
                    <button class="btn btn-default btn-md"><i class="fa fa-angle-left" aria-hidden="true"></i> {$RENEWAL_LANG['home']['returnClientArea']}</button>
                </a>
            </div>
        {/if}
        </div>
    </div>
</div>
