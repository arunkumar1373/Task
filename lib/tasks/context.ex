defmodule Task.Context do
  alias Tasks.TaskContext.Subject
  alias Tasks.TaskContext.Teacher
  alias Tasks.TaskContext.TeacherSubject
  alias Tasks.Repo

  import Ecto.Query

  def insert_subject() do
    attrs = [%{subject: "Science"}, %{subject: "Maths"}, %{subject: "English"}, %{subject: "Hindi"}]
    Repo.insert_all(Subject, attrs)
  end

  def insert_teacher_name() do
    attrs = [%{teacher: "Reegan"}, %{teacher: "John"}, %{teacher: "Jim"}, %{teacher: "Tom"}, %{teacher: "Donald"}]
    Repo.insert_all(Teacher, attrs)
  end

  def assoc_teacher_subject(name, subject) do
    teacher_id = Repo.one(from p in Teacher, where: p.teacher ==^name, select: p.id )

    subject_id = Repo.all(from p in Subject, where: p.subject in ^subject, select: p.id)

    case is_nil(teacher_id) do
      true ->
        nil

      false ->
        case Enum.empty?(subject_id) do
          true ->
            nil

          false ->
            teacher_subject_attrs =
            Enum.map(subject_id, fn x ->
              %{teacher_id: teacher_id, subject_id: x}
            end)

            Repo.insert_all(TeacherSubject, teacher_subject_attrs)
        end
    end
  end




  def question1() do
    Repo.all(from teacher in Teacher, where: teacher.teacher in ^["Tom", "Jim"],
    join: teacher_subject in TeacherSubject, on: teacher_subject.teacher_id == teacher.id,
    join: subject in Subject, on: subject.id == teacher_subject.subject_id,
    select: subject.subject
    ) |> Enum.uniq()

    # output: ["Science", "English", "Maths"]

  end


  def question2() do
    Repo.all(from subject in Subject, where: subject.subject in ^["English", "Hindi"],
    join: teacher_subject in TeacherSubject, on: teacher_subject.subject_id == subject.id,
    join: teacher in Teacher, where: teacher.id == teacher_subject.teacher_id,
    select: teacher.teacher
    ) |> Enum.uniq()

    # output: ["Reegan", "John", "Jim", "Donald"]
  end

  def question3() do
    Repo.all(from teacher in Teacher, where: teacher.teacher in ^["John", "Jim"],
    join: teacher_subject in TeacherSubject, on: teacher_subject.teacher_id == teacher.id,
    join: subject in Subject, on: subject.id == teacher_subject.subject_id,
    select: subject.subject
    ) |> get_duplicate_value()

    # output: ["English"]
  end


  defp get_duplicate_value(list) do
    list
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn {_, [_,_|_]} -> true; _ -> false end)
      |> Enum.map(fn {x, _} -> x end)
  end

end

# What are the subjects Tom and Jim are taking (Scienece, English, Maths)
# Who is taking English and Hindi class
# What are the common subjects between John and Jim
# Someswaran Krishnan3:23 PM
# 		    Science	Maths		English	Hindi
# Reegan		X		   X				         X
# John			       X		    X
# Jim		    X				        X
# Tom		    X		   X
# Donald							              	X
