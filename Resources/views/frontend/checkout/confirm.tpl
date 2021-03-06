{extends file="parent:frontend/checkout/confirm.tpl"}

{block name='frontend_checkout_confirm_form'}
    {include file="frontend/checkout/adyen_libaries.tpl"}

    {$smarty.block.parent}
{/block}

{block name="frontend_checkout_confirm_left_payment_method"}
    {if $sUserData.additional.payment.image}
        <div class="payment--method-image">
            <img src="{$sUserData.additional.payment.image}"  alt="{$sUserData.additional.payment.description}"/>
        </div>
    {/if}

    {$smarty.block.parent}
{/block}

{block name='frontend_index_body_attributes'}
    {$smarty.block.parent}
    {if $mAdyenSnippets}data-AdyenSnippets="{$mAdyenSnippets}"{/if}
    data-adyenAjaxDoPaymentUrl="{url module='frontend' controller='adyen' action='ajaxDoPayment'}"
    data-adyenAjaxIdentifyShopperUrl="{url module='frontend' controller='adyen' action='ajaxIdentifyShopper'}"
    data-adyenAjaxChallengeShopperUrl="{url module='frontend' controller='adyen' action='ajaxChallengeShopper'}"
    {if $mAdyenSnippets}
        data-adyenSnippets="{$mAdyenSnippets}"
    {/if}
    {if $sUserData.additional.payment.type}
        data-adyenType="{$sUserData.additional.payment.type}"
    {/if}
    {if $sAdyenGoogleConfig}
        data-adyenGoogleConfig='{$sAdyenGoogleConfig}'
    {/if}
    {if $sAdyenSetSession}
        data-adyenSetSession='{$sAdyenSetSession}'
    {/if}
    {if $sUserData.additional.payment.name == 'adyen_general_payment_method'}
        data-adyenIsAdyenPayment='true'
    {/if}
{/block}

{block name='frontend_checkout_confirm_error_messages'}
    <div data-adyen-checkout-error="true"></div>

    {$smarty.block.parent}
{/block}
