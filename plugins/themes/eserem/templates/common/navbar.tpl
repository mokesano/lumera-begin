{**
 * templates/common/navbar.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}

<nav>

<div id="fullNav" class="c-navbar" style="max-width: 1440px !important;padding: .1% 5.7%;width: 100%;">
    <div id="u-container" style="padding: .05% 0;float: left;padding-right: 1%;">
        <div id="c-navbar__logo u-margin-right-xl"><img src="{$baseUrl}/public/images/cosire.svg" alt="COSIRE" width="auto" height="27px"> <a href="https://scofci.stipwunaraha.ac.id"></a>
        </div>
    </div>
    <div id="navbar" role="navigation" style="width: 100%;padding: 0 1%;">
	    <ul class="navMenu" style="float: left;">
		    {if $siteCategoriesEnabled}
			<li id="categories"><a href="{url journal="index" page="index"}">{translate key="navigation.otherJournals"}</a></li>
			{/if}{* $categoriesEnabled *}
			<li id="getPublished"><a href="{url page="about" op="submissions" anchor="onlineSubmissions"}">{translate key="common.published"}</a></li>
			<li id="aboutCOSIRE"><a href="https://scofci.stipwunaraha.ac.id/organisasi/">{translate key="common.cosire"}</a></li>
		
	    </ul>
        <ul class="navMenu" style="float: right;">
            {if $isUserLoggedIn}
            {if $hasOtherJournals}
			<li id="userJournal"><a href="{url journal="$currentJournal" page="user"}">My Journals</a></li>
			    {/if}
			<li id="userProfile"><a href="{url page="user" op="profile"}">My Profile</a></li>
			<li id="userHome"><a href="{url page="user"}">User Home</a></li>
			<li id="userLogOut"><a href="{url page="login" op="signOut"}">Log Out</a></li>
			{if $userSession->getSessionVar('signedInAs')}
			    <li id="userLogOutUser"><a href="{url page="login" op="signOutAsUser"}">Log Out as User</a></li>
		    	{/if}
    		{else}
			<li id="userlogin"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
			{if !$hideRegisterLink}
			<li id="userRegister"><a href="{url page="user" op="register"}" >{translate key="navigation.register"}</a></li>
			    {/if}
    		{/if}{* $isUserLoggedIn *}
    		<li id="userSearch"><a href="{url journal="$currentJournal" page="search" op="search"}">Search</a></li>
		</ul>
    </div>
</div> <!-- End Full Nav -->

<div id="mobileNav">
    <div id="u-container" style="float: left;">
        <div id="c-navbar__logo u-margin-right-xl"><img src="{$baseUrl}/public/images/cosire.svg" alt="COSIRE Logo" width="auto" height="27px"> <a href="https://scofci.stipwunaraha.ac.id"></a></div>
        </div>
    <div id="toggle-bar">
        <a class="navicon mtoggle" href="#">MAIN MENU</a></div>
    <div id="navbar" role="navigation">
        <ul class="navMenu menu">
            {if $siteCategoriesEnabled}
            <li id="categories"><a href="{url journal="index" page="index"}">{translate key="navigation.otherJournals"}</a></li>
			{/if}{* $categoriesEnabled *}
			<li id="getPublished"><a href="{url page="about" op="submissions" anchor="onlineSubmissions"}">{translate key="common.published"}</a></li>
			<li id="aboutCOSIRE"><a href="https://scofci.stipwunaraha.ac.id/organisasi/">{translate key="common.cosire"}</a></li>
			<li id="submitButton"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
		
		
		{include file="common/search.tpl"}
	    </ul>
    </div>
</div>
</nav>