<div class="col-md-12">
    <div class="widget p-lg">
        <link href="{$systemurl}modules/addons/renewal/library/templates/assets/css/renewal.css?v={$versionHash}" rel="stylesheet" type="text/css">
        <div id="renewal">
            <div class="row">
                <div class="col-md-12">
                    <div class="info-body">
                        {if $templates['paytype'] == 'recurring'}
                        <div class="col-xs-12 col-12">
                            <div class="row info-box">
                                <div class="col-xs-12 col-md-6">
                                    <div class="info-title">{$RENEWAL_LANG['renewal']['productName']}: </div>
                                    <div class="info-text">{$templates['name']}</div>
                                </div>
                                <div class="col-xs-12 col-12 col-md-6">
                                    <div class="info-title">{$RENEWAL_LANG['renewal']['billingcycle']}: </div>
                                    <div class="info-text">{$templates['billingcycle']}</div>
                                </div>
                                <div class="col-xs-12 col-12 col-md-6">
                                    <div class="info-title">{$RENEWAL_LANG['renewal']['amount']}: </div>
                                    <div class="info-text">{$templates['amount']}</div>
                                </div>
                                <div class="col-xs-12 col-12 col-md-6">
                                    <div class="info-title">{$RENEWAL_LANG['renewal']['nextduedate']}: </div>
                                    <div class="info-text">{$templates['nextduedate']}</div>
                                </div>
                            </div>              
                        </div>
                        {if !empty($templates['info'])}
                            <div class="col-xs-12 col-12">
                                <div class="notice"  role="alert">
                                    <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> {$templates['info']}
                                </div>
                            </div>
                        {/if}
                        <div class="col-xs-12 col-12">
                            <div class="empty" style="height: 30px;"></div>
                        </div>
                        <form method="POST" action="{$systemurl}index.php?m=renewal" class="col-xs-12 col-12">
                        <input type="hidden" name="uid" value="{$templates['uid']}" />
                        <input type="hidden" name="sid" value="{$templates['sid']}" />
                        <input type="hidden" name="sign" value="{$templates['sign']}" />
                        <input type="hidden" name="action" value="doReNew" />
                        <input type="hidden" name="month" value="1" />
                        <div class="row">
                            <div class="col-sm-6 col-xs-12 col-12">
                                <div class="cycle-body">
                                    <div class="cycle-title">{$RENEWAL_LANG['renewal']['chooseBillingCycle']}: </div>
                                    <div class="slider-date">
                                        <ul class="slider-bg clearfix">
                                            {if !empty($templates['renewalTime'])}
                                            {foreach $templates['renewalTime'] as $key => $value}
                                            <li data-time="{$key}" class="month-{$key}">{$value}</li>
                                            {/foreach}
                                            {/if}
                                        </ul>
                                    </div>
                                </div>
                                <div class="cycle-body">
                                    <div class="cycle-title">{$RENEWAL_LANG['renewal']['settingRenewTimes']}: </div>
                                    <div class="input-group quantity-input">
                                        <input type="number" class="form-control input-box2" min="1" max="36" value="1" name="times" id="renewalTimes" onclick="checkPrice();" />
                                    </div>
                                </div>
                                <div class="cycle-body" id="promotions">
                                    <div class="cycle-title">{$RENEWAL_LANG['renewal']['PromoCode']}: </div>
                                    <div class="input-group input-copy">
                                        <input class="form-control input-box" value="" type="text" name="promotion" id="promoInput" placeholder="{$RENEWAL_LANG['renewal']['enterPromoTips']}" autocomplete="off">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default apply-btn" type="button" id="promotionButton">
                                                <span><i class="fa fa-ticket" aria-hidden="true"></i> {$RENEWAL_LANG['renewal']['applyPromoCode']}</span>
                                            </button>
                                            <button class="btn btn-default unapply-btn" type="button" id="resetPromoButton">
                                                <span><i class="fa fa-times" aria-hidden="true"></i> {$RENEWAL_LANG['renewal']['resetPromoCode']}</span>
                                            </button>
                                            <button class="btn btn-default error-btn" type="button" id="resetErrorPromoButton">
                                                <span><i class="fa fa-exclamation" aria-hidden="true"></i> {$RENEWAL_LANG['renewal']['resetPromoCode']}</span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                                <div class="cycle-body">
                                    <div class="apply-success" id="apply-success"><i class="fa fa-check-circle" aria-hidden="true"></i><span class="promoContents"> </span></div>
                                    <div class="apply-error" id="apply-error"><i class="fa fa-times-circle" aria-hidden="true"></i><span class="promoErrorContents"> </span></div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-12 col-12">
                                <div class="confirm-area">
                                    <div class="time-box">
                                        <span class="time-title" id="reNewDueDate">{$RENEWAL_LANG['renewal']['duedateAfterRenew']}: </span>
                                        <div class="time-text" id="afterRenewTime">{$RENEWAL_LANG['renewal']['Calculating']}...</div>
                                    </div>
                                    <div class="price-area">
                                        <span class="price-title" id="needPay">{$RENEWAL_LANG['renewal']['needPay']}: </span>
                                        <span class="price" id="realPrice">{$RENEWAL_LANG['renewal']['Calculating']}...</span>
                                        <div>
                                        <span class="old-price-title" id="oldNeedPay">{$RENEWAL_LANG['renewal']['originalPrice']}: </span>
                                        <span class="old-price" id="oldPrice">{$RENEWAL_LANG['renewal']['Calculating']}...</span>
                                        </div>
                                    </div>
                                    <div class="submit-area">
                                        <button class="btn submit-btn" type="submit" id="submitbutton">{$RENEWAL_LANG['renewal']['confirmRenew']}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                        {else}
                        <div class="col-xs-12 col-12">
                            <div class="alert alert-danger alert-dismissible fade in " role="alert">
                                <span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span> {$RENEWAL_LANG['renewal']['canNotRenew']}
                            </div>
                        </div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
        {literal}
        <script>
        function checkPrice() {
            var times = document.getElementById("renewalTimes").value;
            var month = $('.slider-date li.active').data('time');
            var promotion = document.getElementById("promoInput").value;
            var sid = '{/literal}{$templates['sid']}{literal}';
            var uid = '{/literal}{$templates['uid']}{literal}';
            var sign = '{/literal}{$templates['sign']}{literal}';
            $.ajax({
                cache: false,
                type: 'POST',
                url: '{/literal}{$systemurl}{literal}index.php?m=renewal&action=getPrice',
                data: {
                    uid : uid,
                    sid : sid,
                    month : month,
                    promotion : promotion,
                    times : times,
                    sign : sign
                },
                dataType:'json',
                async: true,
                beforeSend: function () {
                    $('#realPrice').html('{/literal}{$RENEWAL_LANG['renewal']['Calculating']}{literal}...');
                    $('#afterRenewTime').html('{/literal}{$RENEWAL_LANG['renewal']['Calculating']}{literal}...');
                },
                success: function (data) {
                    if (data.status == 'success') {
                        $('#afterRenewTime').removeClass("errorPriceArea");
                        $('#realPrice').removeClass("errorPriceArea");
                        $('#afterRenewTime').html(data.date);
                        $('#realPrice').html(data.price);
                        $('#submitbutton').addClass("submit-btn");
                        $('#submitbutton').removeClass("disubmit-btn");
                        $("#submitbutton").removeAttr("disabled");
                        document.getElementById("needPay").innerHTML="{/literal}{$RENEWAL_LANG['renewal']['needPay']}{literal}：";
                        document.getElementById("reNewDueDate").innerHTML="{/literal}{$RENEWAL_LANG['renewal']['duedateAfterRenew']}{literal}：";              
                    } else {
                        $('#oldNeedPay').hide();
                        $('#oldPrice').hide();
                        if (data.code != 300) {
                            document.getElementById("needPay").innerHTML="{/literal}{$RENEWAL_LANG['renewal']['AppearError']}{literal}：";
                            document.getElementById("reNewDueDate").innerHTML="{/literal}{$RENEWAL_LANG['renewal']['AppearError']}{literal}：";
                            document.getElementById("realPrice").innerHTML= "<span style=\"font-size: 50%;\">" + data.msg + "</span>";
                            $('#afterRenewTime').html(data.msg);
                        } else {
                            document.getElementById("realPrice").innerHTML="<span>{/literal}{$RENEWAL_LANG['renewal']['AppearError']}{literal}</span>";
                            $('#afterRenewTime').html('{/literal}{$RENEWAL_LANG['renewal']['AppearError']}{literal}');
                        }
                        $('#submitbutton').removeClass("submit-btn");
                        $('#submitbutton').addClass("disubmit-btn");
                        $("#submitbutton").attr("disabled","disabled");
                        $('#afterRenewTime').addClass("errorPriceArea");
                        $('#realPrice').addClass("errorPriceArea");
                    }
                    if (data.oldprice) {
                        $('#oldNeedPay').show();
                        $('#oldPrice').show();
                        document.getElementById("oldPrice").innerHTML="<del>" + data.oldprice + "</del>";
                        $('#resetPromoButton').show();
                        $('.promoContents').html(data.description);
                        $('#promotionButton').hide();
                        $('#resetErrorPromoButton').hide();
                        $('#promoInput').attr('readonly',true);
                        $('#apply-error').hide();
                        $('#apply-success').show();
                    } else {
                        $('#oldNeedPay').hide();
                        $('#oldPrice').hide();
                        $('#resetPromoButton').hide();
                        $('#promotionButton').show();
                        $('#resetErrorPromoButton').hide();
                        $('#promoInput').attr('readonly',false);
                        $('#apply-success').hide();
                        $('#apply-error').hide();
                    }
                    if (data.code == '301') {
                        $('#oldNeedPay').hide();
                        $('#oldPrice').hide();
                        $('#resetPromoButton').hide();
                        $('#promotionButton').show();
                        $('#resetErrorPromoButton').hide();
                        $('#promoInput').attr('readonly',false);
                        $('.promoErrorContents').html(data.msg);
                        $('#apply-success').hide();
                        $('#apply-error').show();
                    }
                    if (data.code == '300') {
                        $('#resetPromoButton').hide();
                        $('#resetErrorPromoButton').show();
                        $('.promoErrorContents').html(data.msg);
                        $('#promotionButton').hide();
                        $('#promoInput').attr('readonly',true);
                        $('#apply-success').hide();
                        $('#apply-error').show();
                    }
                    $('input[name="month"]').val(month);
                },
                error: function() {
                    document.getElementById("realPrice").innerHTML="<small>{/literal}{$RENEWAL_LANG['renewal']['networkError']}{literal}</small>";
                    $('#afterRenewTime').html('{/literal}{$RENEWAL_LANG['renewal']['networkError']}{literal}');
                    $('#submitbutton').removeClass("submit-btn");
                    $('#submitbutton').addClass("disubmit-btn");
                    $("#submitbutton").attr("disabled","disabled");
                    document.getElementById("needPay").innerHTML="{/literal}{$RENEWAL_LANG['renewal']['AppearError']}{literal}：";
                    document.getElementById("reNewDueDate").innerHTML="{/literal}{$RENEWAL_LANG['renewal']['AppearError']}{literal}：";
                    $('#promoInput').attr('readonly',false);
                    $('#oldNeedPay').hide();
                    $('#oldPrice').hide();
                    $('#resetPromoButton').hide();
                    $('#promotionButton').show();
                    $('.promoErrorContents').html('{/literal}{$RENEWAL_LANG['renewal']['networkError']}{literal}');
                    $('#apply-success').hide();
                    $('#apply-error').show();
                }
            });     
        }
        $(function(){
            $('#renewalTimes').on('keyup',function(){
                checkPrice();
            });
            $('#promotionButton').click(function() {
                checkPrice();
            });
            $('#resetPromoButton').click(function() {
                $('#oldNeedPay').hide();
                $('#oldPrice').hide();
                var input = document.getElementById("promoInput");
                input.value = "";
                checkPrice();
            });
            $('#resetErrorPromoButton').click(function() {
                $('#oldNeedPay').hide();
                $('#oldPrice').hide();
                var input = document.getElementById("promoInput");
                input.value = "";
                checkPrice();
            });
            $(".month-{/literal}{$templates['month']}{literal}").addClass('active');
            $('#apply-success').hide();
            $('#apply-error').hide();
            $('#oldNeedPay').hide();
            $('#oldPrice').hide();
            $('.slider-date li').click(function() {
                $(this).siblings().removeClass('active before');
                $(this).addClass('active'); 
                checkPrice();
            });
            checkPrice();
        });
        </script>
        {/literal}
    </div>
</div>