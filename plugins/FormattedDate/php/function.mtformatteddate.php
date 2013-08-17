<?php
function smarty_function_mtformatteddate( $args, &$ctx ) {
    require_once( "MTUtil.php" );
    if ( isset( $args[ 'tag' ] ) ) {
        $tag = $args[ 'tag' ];
        $tag = preg_replace( '/^mt:?/i', '', $tag );
        $largs = $args; // local arguments without 'tag' element
        unset( $largs[ 'tag' ] );
        $value = $ctx->tag( $tag, $largs );
    } elseif ( isset( $args[ 'name' ] ) ) {
        $value = $ctx->__stash[ 'vars' ][ $args[ 'name' ] ];
    } elseif ( isset( $args[ 'var' ] ) ) {
        $value = $ctx->__stash[ 'vars' ][ $args[ 'var' ] ];
    }        
    $value = preg_replace( "/\D/", '', $value );
    if ( preg_match( "/^[0-9]{14}$/", $value ) ) {
        $args[ 'ts' ] = $value;
        return $ctx->_hdlr_date( $args, $ctx );
    }
}
?>