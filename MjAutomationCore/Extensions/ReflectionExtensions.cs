﻿using System;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace MjAutomationCore.Extensions
{
    public static class ReflectionExtensions
    {
        public static MemberInfo ResolveMember<TModel, TProperty>(TModel model, Expression<Func<TModel, TProperty>> expression)
        {
            if (!(expression.Body is MemberExpression))
                throw new ArgumentException(
                    "Expression passed to this method should be of type MemberExpression, for example: c => c.Property");

            var memberExpression = (MemberExpression)expression.Body;
            return memberExpression.Member;
        }
    }
}
