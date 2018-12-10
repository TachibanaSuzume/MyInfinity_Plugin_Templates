<div class="col-md-12">
    <div class="widget p-lg">
		<style type="text/css">
			.redirec-area {
			    height: 400px;
			    text-align: center;
			}
			.redirec-text {
			    color: #000;
			    font-weight: 500;
			    font-size: 20px;
			    text-align: center;
			    margin-top: 50px;
			    margin-bottom: 20px;
			}
			.redirec-img {
			    font-size: 80px;
			    text-align: center;
			    margin-top: 100px;
			}
		</style>
		<div class="row">
			<div class="col-xs-12 col-12">
				<div class="redirec-area">
					<i class="fa fa-refresh redirec-img fa-spin" aria-hidden="true"></i>
					<div class="redirec-text">{$RENEWAL_LANG['confirm']['tips'][0]} <a class="btn btn-xs btn-success" href="{$systemurl}viewinvoice.php?id={$invoiceid}">{$RENEWAL_LANG['confirm']['tips'][1]}</a> {$RENEWAL_LANG['confirm']['tips'][2]}</div>
				</div>
			</div>
		</div>
		{literal}
		<script type="text/javascript">
			$(function() {
				window.location.href = "{/literal}{$systemurl}viewinvoice.php?id={$invoiceid}{literal}";
			});
		</script>
		{/literal}
	</div>
</div>