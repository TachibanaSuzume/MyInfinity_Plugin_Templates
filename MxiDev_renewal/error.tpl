<div class="col-md-12">
    <div class="widget p-lg">
        <link rel="stylesheet" href="{$systemurl}modules/addons/renewal/library/templates/assets/css/home.css?v={$versionHash}">
        <div id="renewal">
            <div class="error-msg">
                <i class="fa fa-exclamation-triangle warning-img" aria-hidden="true"></i>
                <div class="error-text">{$info}</div>
                {if $page eq 'clientarea'}
                <a href="clientarea.php">
                    <button class="btn btn-default btn-md"><i class="fa fa-angle-left" aria-hidden="true"></i> {$RENEWAL_LANG['errorpage']['returnClientArea']}</button>
                </a>
                {elseif $page eq 'dorenew'}
                <a href="index.php?m=renewal&action=renew&sid={$sid}">
                    <button class="btn btn-default btn-md"><i class="fa fa-angle-left" aria-hidden="true"></i> {$RENEWAL_LANG['errorpage']['return']}</button>
                </a>
                {/if}
            </div>
        </div>
    </div>
</div>