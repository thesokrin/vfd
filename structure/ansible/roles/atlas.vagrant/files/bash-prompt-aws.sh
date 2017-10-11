if which jq aws >/dev/null && \
    [ ! -z "$AWS_ACCESS_KEY_ID" ] ; then
  AWS_ACCOUNT_ID="$(aws iam get-user | jq -r .User.Arn | awk -F : '{print $5;}')"

  color_clear="\[\e[m\]"
  color_red="\[\e[1;31m\]"
  color_green="\[\e[1;32m\]"
  color_blue="\[\e[1;34m\]"
  color_yellow="\[\e[1;33m\]"

  case "${AWS_ACCOUNT_ID}" in
    "780453558463")
      AWS_ACCOUNT="dev"
      COLOR="$color_green"
      ;;

    "886703752586")
      AWS_ACCOUNT="staging"
      COLOR="$color_yellow"
      ;;

    "202004573189")
      AWS_ACCOUNT="preprod"
      COLOR="$color_green"
      ;;

    "284224159432")
      AWS_ACCOUNT="prod-2.0"
      COLOR="$color_red"
      ;;

    "058144102190")
      AWS_ACCOUNT="prod-3.0"
      COLOR="$color_red"
      ;;

    *)
      AWS_ACCOUNT="unknown"
      ;;
  esac

  PS1="$(printf '%s[%s]%s\n' "$COLOR" "$AWS_ACCOUNT" "$color_clear") $PS1"

  unset COLOR color_clear color_red color_green color_blue color_yellow
fi

if test -d /vagrant; then
   cd /vagrant
fi
